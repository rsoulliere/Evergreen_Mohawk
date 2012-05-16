if (!dojo._hasResource["openils.widget.FlattenerGrid"]) {
    dojo.provide("openils.widget.FlattenerGrid");

    dojo.require("DojoSRF");
    dojo.require("dojox.grid.DataGrid");
    dojo.require("openils.FlattenerStore");
    dojo.require("openils.PermaCrud");
    dojo.require("openils.widget.GridColumnPicker");
    dojo.require("openils.widget.EditDialog");  /* includes EditPane */
    dojo.require("openils.widget._GridHelperColumns");

    dojo.declare(
        "openils.widget.FlattenerGrid",
        [dojox.grid.DataGrid, openils.widget._GridHelperColumns], {
            /* These potential constructor arguments are useful to
             * FlattenerGrid in their own right */
            "columnReordering": true,
            "columnPersistKey": null,
            "showLoadFilter": false,    /* use FlattenerFilterDialog */

            /* These potential constructor arguments maybe useful to
             * FlattenerGrid in their own right, and are passed to
             * FlattenerStore. */
            "fmClass": null,
            "fmIdentifier": null,
            "mapExtras": null,
            "defaultSort": null,  /* whatever any part of the UI says will
                                     /replace/ this */
            "baseSort": null,     /* will contains what the columnpicker
                                     dictates, and precedes whatever the column
                                     headers provide. */

            /* These potential constructor arguments are for functionality
             * copied from AutoGrid */
            "editOnEnter": false,       /* also implies edit-on-dblclick */
            "editStyle": "dialog",      /* "dialog" or "pane" */
            "requiredFields": null,     /* affects create/edit dialogs */
            "suppressEditFields": null, /* affects create/edit dialogs */

            /* _generateMap() lives to interpret the attributes of the
             * FlattenerGrid dijit itself plus those definined in
             * <table>
             *  <thead>
             *   <tr>
             *    <th field="foo" ...>
             * to build the map to hand to the FlattenerStore, which in turn
             * uses it to query the flattener service.
             */
            "_generateMap": function() {
                var map = this.mapClause = {};
                var fields = this.structure[0].cells[0];

                /* These are the fields defined in thead -> tr -> [th,th,...].
                 * For purposes of building the map, where each field has
                 * three boolean attributes "display", "sort" and "filter",
                 * assume "display" and "sort" are always true for these.
                 * That doesn't mean that at the UI level we can't hide a
                 * column later.
                 *
                 * If you need extra fields in the map for which display
                 * or sort should *not* be true, use mapExtras.
                 */
                dojo.forEach(
                    fields, function(field) {
                        if (field.field.match(/^\+/))
                            return; /* special fields e.g. checkbox/line # */

                        map[field.field] = {
                            "display": true,
                            "filter": (field.ffilter || false),
                            "sort": true,
                            "path": field.fpath || field.field
                        };
                        /* The following attribute is not for the flattener
                         * service's benefit, but for other uses. We capture
                         * the hardcoded <th> value (the header label) if any.*/
                        if (field.name)
                            map[field.field]._label = field.name;
                    }
                );

                if (this.mapExtras) {
                    /* It's not particularly useful to add simple fields, i.e.
                     *  circ_lib: "circ_lib.name"
                     * to mapExtras, because by convention used elsewhere in
                     * Flattener, that gives all attributes, including
                     * display, a true value. Still, be consistent to avoid
                     * stumping users.
                     */
                    for (var key in this.mapExtras) {
                        if (typeof this.mapExtras[key] != "object") {
                            this.mapExtras[key] = {
                                "path": this.mapExtras[key],
                                "sort": true,
                                "filter": true,
                                "display": true
                            };
                        }
                    }
                    dojo.mixin(map, this.mapExtras);
                }

                /* Do this now, since we don't want a silently added
                 * identifier attribute in the terminii list (see its uses). */
                this._calculateMapTerminii();
                this._supplementHeaderNames();

                /* make sure we always have a field for fm identifier */
                if (!map[this.fmIdentifier]) {
                    map[this.fmIdentifier] = {
                        "path": this.fmIdentifier,
                        "display": true,    /* Flattener displays it to us,
                                               but we don't display to user. */
                        "sort": false,
                        "filter": true
                    };
                }

                return map;
            },

            "_cleanMapForStore": function(map) {
                var clean = dojo.clone(map);

                for (var column in clean) {
                    openils.Util.objectProperties(clean[column]).filter(
                        function(k) { return k.match(/^_/); }
                    ).forEach(
                        function(k) { delete clean[column][k]; }
                    );
                }

                return clean;
            },

            /* The FlattenerStore doesn't need this, but it has at least two
             * uses: 1) FlattenerFilterDialog, 2) setting column header labels
             * to IDL defaults.
             *
             * To call these 'Terminii' can be misleading. In certain
             * (actually probably common) cases, they won't really be the last
             * field in a path, but the next-to-last. Read on. */
            "_calculateMapTerminii": function() {
                function _fm_is_selector_for_class(hint, field) {
                    var cl = fieldmapper.IDL.fmclasses[hint];
                    return (cl.field_map[cl.pkey].selector == field);
                }

                function _follow_to_end(hint, path) {
                    var last_field, last_hint;
                    var orig_path = dojo.clone(path);
                    var field;

                    while (field = path.shift()) {
                        /* XXX this assumes we have the whole IDL loaded. I
                         * guess we could teach this to work by loading classes
                         * on demand when we don't have the whole IDL loaded. */
                        var field_def =
                            fieldmapper.IDL.fmclasses[hint].field_map[field];

                        if (field_def["class"] && path.length) {
                            last_field = field;
                            last_hint = hint;

                            hint = field_def["class"];
                        } else if (path.length) {
                            /* There are more fields left but we can't follow
                             * the chain via IDL any further. */
                            throw new Error(
                                "_calculateMapTerminii can't parse path " +
                                orig_path + " (at " + field + ")"
                            );
                        } else {
                            break;  /* keeps field defined after loop */
                        }
                    }

                    var datatype = field_def.datatype;
                    var indirect = false;
                    /* Back off the last field in the path if it's a selector
                     * for its class, because the preceding field will be
                     * a better thing to hand to AutoFieldWidget.
                     */
                    if (orig_path.length > 1 &&
                            _fm_is_selector_for_class(hint, field)) {
                        hint = last_hint;
                        field = last_field;
                        datatype = "link";
                        indirect = true;
                    }

                    return {
                        "fmClass": hint,
                        "name": field,
                        "label": field_def.label,
                        "datatype": datatype,
                        "indirect": indirect
                    };
                }

                this.mapTerminii = [];
                for (var column in this.mapClause) {
                    var terminus = dojo.mixin(
                        _follow_to_end(
                            this.fmClass,
                            this.mapClause[column].path.split(/\./)
                        ), {
                            "simple_name": column,
                            "isfilter": this.mapClause[column].filter
                        }
                    );
                    if (this.mapClause[column]._label)
                        terminus.label = this.mapClause[column]._label;

                    this.mapTerminii.push(terminus);
                }
            },

            "_supplementHeaderNames": function() {
                /* You'd be surprised how rarely this make sense in Flattener
                 * use cases, but if we didn't give a particular header cell
                 * (<th>) a display name (the innerHTML of that <th>), then
                 * use the IDL to provide the label of the terminus of the
                 * flattener path for that column. It may be better than using
                 * the raw field name. */
                var self = this;
                this.structure[0].cells[0].forEach(
                    function(header) {
                        if (!header.name) {
                            header.name = self.mapTerminii.filter(
                                function(t) {
                                    return t.simple_name == header.field;
                                }
                            )[0].label;
                        }
                    }
                );
            },

            "constructor": function(args) {
                dojo.mixin(this, args);

                this.fmIdentifier = this.fmIdentifier ||
                    fieldmapper.IDL.fmclasses[this.fmClass].pkey;
            },

            "startup": function() {

                /* Save original query for further filtering later */
                this._baseQuery = dojo.clone(this.query);
                this._startupGridHelperColumns();

                if (!this.columnPicker) {
                    this.columnPicker =
                        new openils.widget.GridColumnPicker(
                            null, this.columnPersistKey, this);
                    this.columnPicker.onLoad = dojo.hitch(
                        this, function(opts) { this._finishStartup(opts.sortFields) });

                    this.columnPicker.onSortChange = dojo.hitch(this,
                        /* directly after, this.update() is called by the
                           column picker, causing a re-fetch */
                        function(fields) {
                            this.store.baseSort = this._mapCPSortFields(fields)
                        }
                    );

                    this.columnPicker.load();
                }

                this.inherited(arguments);
            },

            /*  Maps ColumnPicker sort fields to the correct format.
                If no sort fields specified, falls back to defaultSort */
            "_mapCPSortFields": function(sortFields) {
                var sort = this.defaultSort;
                if (sortFields.length) {
                    sort = sortFields.map(function(f) {
                        a = {};
                        a[f.field] = f.direction;
                        return a;
                    });
                }
                return sort;
            },

            "_finishStartup": function(sortFields) {

                this.setStore(
                    new openils.FlattenerStore({
                        "fmClass": this.fmClass,
                        "fmIdentifier": this.fmIdentifier,
                        "mapClause": (this.mapClause ||
                            this._cleanMapForStore(this._generateMap())),
                        "baseSort": this.baseSort,
                        "defaultSort": this._mapCPSortFields(sortFields)
                    }), this.query
                );

                // pick up any column label changes
                this.columnPicker.reloadStructure();

                this._showing_create_pane = false;

                this.overrideEditWidgets = {};
                this.overrideEditWidgetClass = {};
                this.overrideWidgetArgs = {};

                if (this.editOnEnter)
                    this._applyEditOnEnter();
                else if (this.singleEditStyle)
                    this._applySingleEditStyle();

                /* Like AutoGrid's paginator, but we'll never have Back/Next
                 * links.  Just a place to hold misc links */
                this._setupLinks();
            },


            "_setupLinks": function() {
                this.linkHolder = new dijit.layout.ContentPane();
                dojo.place(this.linkHolder.domNode, this.domNode, "before");

                if (this.showLoadFilter) {
                    dojo.require("openils.widget.FlattenerFilterDialog");
                    this.filterDialog =
                        new openils.widget.FlattenerFilterDialog({
                            "fmClass": this.fmClass,
                            "mapTerminii": this.mapTerminii
                        });

                    this.filterDialog.onApply = dojo.hitch(
                        this, function(filter) {
                            this.filter(
                                dojo.mixin(filter, this._baseQuery),
                                true    /* re-render */
                            );
                        }
                    );

                    this.filterDialog.startup();
                    dojo.create(
                        "a", {
                            "innerHTML": "Filter",  /* XXX i18n */
                            "href": "javascript:void(0);",
                            "onclick": dojo.hitch(this, function() {
                                this.filterDialog.show();
                            })
                        }, this.linkHolder.domNode
                    );
                }
            },

            /* ******** below are methods mostly copied but
             * slightly changed from AutoGrid ******** */

            "_applySingleEditStyle": function() {
                this.onMouseOverRow = function(e) {};
                this.onMouseOutRow = function(e) {};
                this.onCellFocus = function(cell, rowIndex) {
                    this.selection.deselectAll();
                    this.selection.select(this.focus.rowIndex);
                };
            },

            /* capture keydown and launch edit dialog on enter */
            "_applyEditOnEnter": function() {
                this._applySingleEditStyle();

                dojo.connect(
                    this, "onRowDblClick", function(e) {
                        if (this.editStyle == "pane")
                            this._drawEditPane(
                                this.selection.getFirstSelected(),
                                this.focus.rowIndex
                            );
                        else
                            this._drawEditDialog(
                                this.selection.getFirstSelected(),
                                this.focus.rowIndex
                            );
                    }
                );

                dojo.connect(
                    this, "onKeyDown", function(e) {
                        if (e.keyCode == dojo.keys.ENTER) {
                            this.selection.deselectAll();
                            this.selection.select(this.focus.rowIndex);
                            if (this.editStyle == "pane")
                                this._drawEditPane(
                                    this.selection.getFirstSelected(),
                                    this.focus.rowIndex
                                );
                            else
                                this._drawEditDialog(
                                    this.selection.getFirstSelected(),
                                    this.focus.rowIndex
                                );
                        }
                    }
                );
            },

            "_makeEditPane": function(storeItem, rowIndex, onPostSubmit, onCancel) {
                var grid = this;
                var fmObject = (new openils.PermaCrud()).retrieve(
                    this.fmClass,
                    this.store.getIdentity(storeItem)
                );

                var pane = new openils.widget.EditPane({
                    "fmObject": fmObject,
                    "hideSaveButton": this.editReadOnly,
                    "readOnly": this.editReadOnly,
                    "overrideWidgets": this.overrideEditWidgets,
                    "overrideWidgetClass": this.overrideEditWidgetClass,
                    "overrideWidgetArgs": this.overrideWidgetArgs,
                    "disableWidgetTest": this.disableWidgetTest,
                    "requiredFields": this.requiredFields,
                    "suppressFields": this.suppressEditFields,
                    "onPostSubmit": function() {
                        /* ask the store to call flattener specially to get
                         * the flat row related to only this fmobj */
                        grid.store.loadItem({"force": true, "item": storeItem});

                        if (grid.onPostUpdate)
                            grid.onPostUpdate(storeItem, rowIndex);

                        setTimeout(
                            function() {
                                try {
                                    grid.views.views[0].getCellNode(
                                        rowIndex, 0
                                    ).focus();
                                } catch (E) { }
                            }, 200
                        );
                        if (onPostSubmit)
                            onPostSubmit();
                    },
                    "onCancel": function() {
                        setTimeout(
                            function() {
                                grid.views.views[0].getCellNode(
                                    rowIndex, 0
                                ).focus();
                            }, 200
                        );
                        if (onCancel)
                            onCancel();
                    }
                });

                if (typeof this.editPaneOnSubmit == "function")
                    pane.onSubmit = this.editPaneOnSubmit;

                pane.fieldOrder = this.fieldOrder;
                pane.mode = "update";
                return pane;
            },

            "_makeCreatePane": function(onPostSubmit, onCancel) {
                var grid = this;
                var pane = new openils.widget.EditPane({
                    "fmClass": this.fmClass,
                    "overrideWidgets": this.overrideEditWidgets,
                    "overrideWidgetClass": this.overrideEditWidgetClass,
                    "overrideWidgetArgs": this.overrideWidgetArgs,
                    "disableWidgetTest": this.disableWidgetTest,
                    "requiredFields": this.requiredFields,
                    "suppressFields": this.suppressEditFields,
                    "onPostSubmit": function(req, cudResults) {
                        var fmObject = cudResults[0];
                        if (grid.onPostCreate)
                            grid.onPostCreate(fmObject);
                        if (fmObject) {
                            grid.store.fetchItemByIdentity({
                                "identity": fmObject[grid.fmIdentifier](),
                                "onItem": function(item) {
                                    grid.store.onNew(item);
                                }
                            });
                        }

                        setTimeout(
                            function() {
                                try {
                                    grid.selection.select(grid.rowCount - 1);
                                    grid.views.views[0].getCellNode(
                                        grid.rowCount - 1, 1
                                    ).focus();
                                } catch (E) { }
                            }, 200
                        );

                        if (onPostSubmit)
                            onPostSubmit(fmObject);
                    },
                    "onCancel": function() { if (onCancel) onCancel(); }
                });

                if (typeof this.createPaneOnSubmit == "function")
                    pane.onSubmit = this.createPaneOnSubmit;
                pane.fieldOrder = this.fieldOrder;
                pane.mode = "create";
                return pane;
            },

            /**
             * Creates an EditPane with a copy of the data from the provided store
             * item for cloning said item
             * @param {Object} storeItem Dojo data item
             * @param {Number} rowIndex The Grid row index of the item to be cloned
             * @param {Function} onPostSubmit Optional callback for post-submit behavior
             * @param {Function} onCancel Optional callback for clone cancelation
             * @return {Object} The clone EditPane
             */
            "_makeClonePane": function(storeItem,rowIndex,onPostSubmit,onCancel) {
                var clonePane = this._makeCreatePane(onPostSubmit, onCancel);
                var origPane = this._makeEditPane(storeItem, rowIndex);
                clonePane.startup();
                origPane.startup();
                dojo.forEach(
                    origPane.fieldList, function(field) {
                        if (field.widget.widget.attr('disabled'))
                            return;

                        var w = clonePane.fieldList.filter(
                            function(i) { return (i.name == field.name) }
                        )[0];

                        // sync widgets
                        w.widget.baseWidgetValue(field.widget.widget.attr('value'));

                        // async widgets
                        w.widget.onload = function() {
                            w.widget.baseWidgetValue(
                                field.widget.widget.attr('value')
                            )
                        };
                    }
                );
                origPane.destroy();
                return clonePane;
            },


            "_drawEditDialog": function(storeItem, rowIndex) {
                var done = dojo.hitch(this, function() { this.hideDialog(); });
                var pane = this._makeEditPane(storeItem, rowIndex, done, done);
                this.editDialog = new openils.widget.EditDialog({editPane:pane});
                this.editDialog.startup();
                this.editDialog.show();
            },

            /**
             * Generates an EditDialog for object creation and displays it to the user
             */
            "showCreateDialog": function() {
                var done = dojo.hitch(this, function() { this.hideDialog(); });
                var pane = this._makeCreatePane(done, done);
                this.editDialog = new openils.widget.EditDialog({editPane:pane});
                this.editDialog.startup();
                this.editDialog.show();
            },

            "_drawEditPane": function(storeItem, rowIndex) {
                var done = dojo.hitch(this, function() { this.hidePane(); });

                dojo.style(this.domNode, "display", "none");

                this.editPane = this._makeEditPane(storeItem, rowIndex, done, done);
                this.editPane.startup();
                dojo.place(this.editPane.domNode, this.domNode, "before");

                if (this.onEditPane)
                    this.onEditPane(this.editPane);
            },

            "showClonePane": function(onPostSubmit) {
                var done = dojo.hitch(this, function() { this.hidePane(); });
                var row = this.getFirstSelectedRow();

                if (!row)
                    return;

                if (onPostSubmit) {
                    postSubmit = dojo.hitch(
                        this, function(result) {
                            onPostSubmit(this.getItem(row), result);
                            this.hidePane();
                        }
                    );
                } else {
                    postSubmit = done;
                }

                dojo.style(this.domNode, "display", "none");
                this.editPane = this._makeClonePane(
                    this.getItem(row), row, postSubmit, done
                );
                dojo.place(this.editPane.domNode, this.domNode, "before");
                if (this.onEditPane)
                    this.onEditPane(this.editPane);
            },

            "showCreatePane": function() {
                if (this._showing_create_pane)
                    return;
                this._showing_create_pane = true;

                var done = dojo.hitch(
                    this, function() {
                        this._showing_create_pane = false;
                        this.hidePane();
                    }
                );

                dojo.style(this.domNode, "display", "none");

                this.editPane = this._makeCreatePane(done, done);
                this.editPane.startup();

                dojo.place(this.editPane.domNode, this.domNode, "before");

                if (this.onEditPane)
                    this.onEditPane(this.editPane);
            },

            "hideDialog": function() {
                this.editDialog.hide();
                this.editDialog.destroy();
                delete this.editDialog;
                this.update();
            },

            "hidePane": function() {
                this.domNode.parentNode.removeChild(this.editPane.domNode);
                this.editPane.destroy();
                delete this.editPane;
                dojo.style(this.domNode, "display", "block");
                this.update();
            },

            "deleteSelected": function() {
                var self = this;

                this.getSelectedItems().forEach(
                    function(item) {
                        var fmobj = new fieldmapper[self.fmClass]();
                        fmobj[self.fmIdentifier](
                            self.store.getIdentity(item)
                        );
                        (new openils.PermaCrud()).eliminate(
                            fmobj, {
                                "oncomplete": function() {
                                    self.store.deleteItem(item);
                                }
                            }
                        );
                    }
                );
            }
        }
    );

    /* monkey patch so we can get more attributes from each column in the
     * markup that specifies grid columns (table->thead->tr->[td,...])
     */
    (function() {
        var b = dojox.grid.cells._Base;
        var orig_mf = b.markupFactory;

        b.markupFactory = function(node, cellDef) {
            orig_mf(node, cellDef);

            dojo.forEach(
                ["fpath", "ffilter"], function(a) {
                    var value = dojo.attr(node, a);
                    if (value)
                        cellDef[a] = value;
                }
            );
        };
    })();

    /* the secret to successfully subclassing dojox.grid.DataGrid */
    openils.widget.FlattenerGrid.markupFactory =
        dojox.grid.DataGrid.markupFactory;
}
