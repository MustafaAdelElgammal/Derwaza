! function(e, t) {
    var i, s, n = 0,
        a = /^ui-id-\d+$/;
    (e.ui = e.ui || {}, e.ui.version) || (e.extend(e.ui, {
        version: "1.9.2",
        keyCode: {
            BACKSPACE: 8,
            COMMA: 188,
            DELETE: 46,
            DOWN: 40,
            END: 35,
            ENTER: 13,
            ESCAPE: 27,
            HOME: 36,
            LEFT: 37,
            NUMPAD_ADD: 107,
            NUMPAD_DECIMAL: 110,
            NUMPAD_DIVIDE: 111,
            NUMPAD_ENTER: 108,
            NUMPAD_MULTIPLY: 106,
            NUMPAD_SUBTRACT: 109,
            PAGE_DOWN: 34,
            PAGE_UP: 33,
            PERIOD: 190,
            RIGHT: 39,
            SPACE: 32,
            TAB: 9,
            UP: 38
        }
    }), e.fn.extend({
        _focus: e.fn.focus,
        focus: function(t, i) {
            return "number" == typeof t ? this.each(function() {
                var s = this;
                setTimeout(function() {
                    e(s).focus(), i && i.call(s)
                }, t)
            }) : this._focus.apply(this, arguments)
        },
        scrollParent: function() {
            var t;
            return t = e.ui.ie && /(static|relative)/.test(this.css("position")) || /absolute/.test(this.css("position")) ? this.parents().filter(function() {
                return /(relative|absolute|fixed)/.test(e.css(this, "position")) && /(auto|scroll)/.test(e.css(this, "overflow") + e.css(this, "overflow-y") + e.css(this, "overflow-x"))
            }).eq(0) : this.parents().filter(function() {
                return /(auto|scroll)/.test(e.css(this, "overflow") + e.css(this, "overflow-y") + e.css(this, "overflow-x"))
            }).eq(0), /fixed/.test(this.css("position")) || !t.length ? e(document) : t
        },
        zIndex: function(i) {
            if (i !== t) return this.css("zIndex", i);
            if (this.length)
                for (var s, n, a = e(this[0]); a.length && a[0] !== document;) {
                    if (("absolute" === (s = a.css("position")) || "relative" === s || "fixed" === s) && (n = parseInt(a.css("zIndex"), 10), !isNaN(n) && 0 !== n)) return n;
                    a = a.parent()
                }
            return 0
        },
        uniqueId: function() {
            return this.each(function() {
                this.id || (this.id = "ui-id-" + ++n)
            })
        },
        removeUniqueId: function() {
            return this.each(function() {
                a.test(this.id) && e(this).removeAttr("id")
            })
        }
    }), e.extend(e.expr[":"], {
        data: e.expr.createPseudo ? e.expr.createPseudo(function(t) {
            return function(i) {
                return !!e.data(i, t)
            }
        }) : function(t, i, s) {
            return !!e.data(t, s[3])
        },
        focusable: function(t) {
            return o(t, !isNaN(e.attr(t, "tabindex")))
        },
        tabbable: function(t) {
            var i = e.attr(t, "tabindex"),
                s = isNaN(i);
            return (s || i >= 0) && o(t, !s)
        }
    }), e(function() {
        var t = document.body,
            i = t.appendChild(i = document.createElement("div"));
        i.offsetHeight, e.extend(i.style, {
            minHeight: "100px",
            height: "auto",
            padding: 0,
            borderWidth: 0
        }), e.support.minHeight = 100 === i.offsetHeight, e.support.selectstart = "onselectstart" in i, t.removeChild(i).style.display = "none"
    }), e("<a>").outerWidth(1).jquery || e.each(["Width", "Height"], function(i, s) {
        var n = "Width" === s ? ["Left", "Right"] : ["Top", "Bottom"],
            a = s.toLowerCase(),
            o = {
                innerWidth: e.fn.innerWidth,
                innerHeight: e.fn.innerHeight,
                outerWidth: e.fn.outerWidth,
                outerHeight: e.fn.outerHeight
            };

        function u(t, i, s, a) {
            return e.each(n, function() {
                i -= parseFloat(e.css(t, "padding" + this)) || 0, s && (i -= parseFloat(e.css(t, "border" + this + "Width")) || 0), a && (i -= parseFloat(e.css(t, "margin" + this)) || 0)
            }), i
        }
        e.fn["inner" + s] = function(i) {
            return i === t ? o["inner" + s].call(this) : this.each(function() {
                e(this).css(a, u(this, i) + "px")
            })
        }, e.fn["outer" + s] = function(t, i) {
            return "number" != typeof t ? o["outer" + s].call(this, t) : this.each(function() {
                e(this).css(a, u(this, t, !0, i) + "px")
            })
        }
    }), e("<a>").data("a-b", "a").removeData("a-b").data("a-b") && (e.fn.removeData = (i = e.fn.removeData, function(t) {
        return arguments.length ? i.call(this, e.camelCase(t)) : i.call(this)
    })), s = /msie ([\w.]+)/.exec(navigator.userAgent.toLowerCase()) || [], e.ui.ie = !!s.length, e.ui.ie6 = 6 === parseFloat(s[1], 10), e.fn.extend({
        disableSelection: function() {
            return this.bind((e.support.selectstart ? "selectstart" : "mousedown") + ".ui-disableSelection", function(e) {
                e.preventDefault()
            })
        },
        enableSelection: function() {
            return this.unbind(".ui-disableSelection")
        }
    }), e.extend(e.ui, {
        plugin: {
            add: function(t, i, s) {
                var n, a = e.ui[t].prototype;
                for (n in s) a.plugins[n] = a.plugins[n] || [], a.plugins[n].push([i, s[n]])
            },
            call: function(e, t, i) {
                var s, n = e.plugins[t];
                if (n && e.element[0].parentNode && 11 !== e.element[0].parentNode.nodeType)
                    for (s = 0; s < n.length; s++) e.options[n[s][0]] && n[s][1].apply(e.element, i)
            }
        },
        contains: e.contains,
        hasScroll: function(t, i) {
            if ("hidden" === e(t).css("overflow")) return !1;
            var s, n = i && "left" === i ? "scrollLeft" : "scrollTop";
            return t[n] > 0 || (t[n] = 1, s = t[n] > 0, t[n] = 0, s)
        },
        isOverAxis: function(e, t, i) {
            return e > t && e < t + i
        },
        isOver: function(t, i, s, n, a, o) {
            return e.ui.isOverAxis(t, s, a) && e.ui.isOverAxis(i, n, o)
        }
    }));

    function o(t, i) {
        var s, n, a, o = t.nodeName.toLowerCase();
        return "area" === o ? (n = (s = t.parentNode).name, !(!t.href || !n || "map" !== s.nodeName.toLowerCase()) && (!!(a = e("img[usemap=#" + n + "]")[0]) && u(a))) : (/input|select|textarea|button|object/.test(o) ? !t.disabled : "a" === o && t.href || i) && u(t)
    }

    function u(t) {
        return e.expr.filters.visible(t) && !e(t).parents().andSelf().filter(function() {
            return "hidden" === e.css(this, "visibility")
        }).length
    }
}(jQuery),
    function(e, t) {
        var i = 0,
            s = Array.prototype.slice,
            n = e.cleanData;
        e.cleanData = function(t) {
            for (var i, s = 0; null != (i = t[s]); s++) try {
                e(i).triggerHandler("remove")
            } catch (e) {}
            n(t)
        }, e.widget = function(t, i, s) {
            var n, a, o, u, r = t.split(".")[0];
            t = t.split(".")[1], n = r + "-" + t, s || (s = i, i = e.Widget), e.expr[":"][n.toLowerCase()] = function(t) {
                return !!e.data(t, n)
            }, e[r] = e[r] || {}, a = e[r][t], o = e[r][t] = function(e, t) {
                if (!this._createWidget) return new o(e, t);
                arguments.length && this._createWidget(e, t)
            }, e.extend(o, a, {
                version: s.version,
                _proto: e.extend({}, s),
                _childConstructors: []
            }), (u = new i).options = e.widget.extend({}, u.options), e.each(s, function(t, n) {
                var a, o;
                e.isFunction(n) && (s[t] = (a = function() {
                    return i.prototype[t].apply(this, arguments)
                }, o = function(e) {
                    return i.prototype[t].apply(this, e)
                }, function() {
                    var e, t = this._super,
                        i = this._superApply;
                    return this._super = a, this._superApply = o, e = n.apply(this, arguments), this._super = t, this._superApply = i, e
                }))
            }), o.prototype = e.widget.extend(u, {
                widgetEventPrefix: a ? u.widgetEventPrefix : t
            }, s, {
                constructor: o,
                namespace: r,
                widgetName: t,
                widgetBaseClass: n,
                widgetFullName: n
            }), a ? (e.each(a._childConstructors, function(t, i) {
                var s = i.prototype;
                e.widget(s.namespace + "." + s.widgetName, o, i._proto)
            }), delete a._childConstructors) : i._childConstructors.push(o), e.widget.bridge(t, o)
        }, e.widget.extend = function(i) {
            for (var n, a, o = s.call(arguments, 1), u = 0, r = o.length; u < r; u++)
                for (n in o[u]) a = o[u][n], o[u].hasOwnProperty(n) && a !== t && (e.isPlainObject(a) ? i[n] = e.isPlainObject(i[n]) ? e.widget.extend({}, i[n], a) : e.widget.extend({}, a) : i[n] = a);
            return i
        }, e.widget.bridge = function(i, n) {
            var a = n.prototype.widgetFullName || i;
            e.fn[i] = function(o) {
                var u = "string" == typeof o,
                    r = s.call(arguments, 1),
                    h = this;
                return o = !u && r.length ? e.widget.extend.apply(null, [o].concat(r)) : o, u ? this.each(function() {
                    var s, n = e.data(this, a);
                    return n ? e.isFunction(n[o]) && "_" !== o.charAt(0) ? (s = n[o].apply(n, r)) !== n && s !== t ? (h = s && s.jquery ? h.pushStack(s.get()) : s, !1) : void 0 : e.error("no such method '" + o + "' for " + i + " widget instance") : e.error("cannot call methods on " + i + " prior to initialization; attempted to call method '" + o + "'")
                }) : this.each(function() {
                    var t = e.data(this, a);
                    t ? t.option(o || {})._init() : e.data(this, a, new n(o, this))
                }), h
            }
        }, e.Widget = function() {}, e.Widget._childConstructors = [], e.Widget.prototype = {
            widgetName: "widget",
            widgetEventPrefix: "",
            defaultElement: "<div>",
            options: {
                disabled: !1,
                create: null
            },
            _createWidget: function(t, s) {
                s = e(s || this.defaultElement || this)[0], this.element = e(s), this.uuid = i++, this.eventNamespace = "." + this.widgetName + this.uuid, this.options = e.widget.extend({}, this.options, this._getCreateOptions(), t), this.bindings = e(), this.hoverable = e(), this.focusable = e(), s !== this && (e.data(s, this.widgetName, this), e.data(s, this.widgetFullName, this), this._on(!0, this.element, {
                    remove: function(e) {
                        e.target === s && this.destroy()
                    }
                }), this.document = e(s.style ? s.ownerDocument : s.document || s), this.window = e(this.document[0].defaultView || this.document[0].parentWindow)), this._create(), this._trigger("create", null, this._getCreateEventData()), this._init()
            },
            _getCreateOptions: e.noop,
            _getCreateEventData: e.noop,
            _create: e.noop,
            _init: e.noop,
            destroy: function() {
                this._destroy(), this.element.unbind(this.eventNamespace).removeData(this.widgetName).removeData(this.widgetFullName).removeData(e.camelCase(this.widgetFullName)), this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName + "-disabled ui-state-disabled"), this.bindings.unbind(this.eventNamespace), this.hoverable.removeClass("ui-state-hover"), this.focusable.removeClass("ui-state-focus")
            },
            _destroy: e.noop,
            widget: function() {
                return this.element
            },
            option: function(i, s) {
                var n, a, o, u = i;
                if (0 === arguments.length) return e.widget.extend({}, this.options);
                if ("string" == typeof i)
                    if (u = {}, i = (n = i.split(".")).shift(), n.length) {
                        for (a = u[i] = e.widget.extend({}, this.options[i]), o = 0; o < n.length - 1; o++) a[n[o]] = a[n[o]] || {}, a = a[n[o]];
                        if (i = n.pop(), s === t) return a[i] === t ? null : a[i];
                        a[i] = s
                    } else {
                        if (s === t) return this.options[i] === t ? null : this.options[i];
                        u[i] = s
                    }
                return this._setOptions(u), this
            },
            _setOptions: function(e) {
                var t;
                for (t in e) this._setOption(t, e[t]);
                return this
            },
            _setOption: function(e, t) {
                return this.options[e] = t, "disabled" === e && (this.widget().toggleClass(this.widgetFullName + "-disabled ui-state-disabled", !!t).attr("aria-disabled", t), this.hoverable.removeClass("ui-state-hover"), this.focusable.removeClass("ui-state-focus")), this
            },
            enable: function() {
                return this._setOption("disabled", !1)
            },
            disable: function() {
                return this._setOption("disabled", !0)
            },
            _on: function(t, i, s) {
                var n, a = this;
                "boolean" != typeof t && (s = i, i = t, t = !1), s ? (i = n = e(i), this.bindings = this.bindings.add(i)) : (s = i, i = this.element, n = this.widget()), e.each(s, function(s, o) {
                    function u() {
                        if (t || !0 !== a.options.disabled && !e(this).hasClass("ui-state-disabled")) return ("string" == typeof o ? a[o] : o).apply(a, arguments)
                    }
                    "string" != typeof o && (u.guid = o.guid = o.guid || u.guid || e.guid++);
                    var r = s.match(/^(\w+)\s*(.*)$/),
                        h = r[1] + a.eventNamespace,
                        l = r[2];
                    l ? n.delegate(l, h, u) : i.bind(h, u)
                })
            },
            _off: function(e, t) {
                t = (t || "").split(" ").join(this.eventNamespace + " ") + this.eventNamespace, e.unbind(t).undelegate(t)
            },
            _delay: function(e, t) {
                var i = this;
                return setTimeout(function() {
                    return ("string" == typeof e ? i[e] : e).apply(i, arguments)
                }, t || 0)
            },
            _hoverable: function(t) {
                this.hoverable = this.hoverable.add(t), this._on(t, {
                    mouseenter: function(t) {
                        e(t.currentTarget).addClass("ui-state-hover")
                    },
                    mouseleave: function(t) {
                        e(t.currentTarget).removeClass("ui-state-hover")
                    }
                })
            },
            _focusable: function(t) {
                this.focusable = this.focusable.add(t), this._on(t, {
                    focusin: function(t) {
                        e(t.currentTarget).addClass("ui-state-focus")
                    },
                    focusout: function(t) {
                        e(t.currentTarget).removeClass("ui-state-focus")
                    }
                })
            },
            _trigger: function(t, i, s) {
                var n, a, o = this.options[t];
                if (s = s || {}, (i = e.Event(i)).type = (t === this.widgetEventPrefix ? t : this.widgetEventPrefix + t).toLowerCase(), i.target = this.element[0], a = i.originalEvent)
                    for (n in a) n in i || (i[n] = a[n]);
                return this.element.trigger(i, s), !(e.isFunction(o) && !1 === o.apply(this.element[0], [i].concat(s)) || i.isDefaultPrevented())
            }
        }, e.each({
            show: "fadeIn",
            hide: "fadeOut"
        }, function(t, i) {
            e.Widget.prototype["_" + t] = function(s, n, a) {
                "string" == typeof n && (n = {
                    effect: n
                });
                var o, u = n ? !0 === n || "number" == typeof n ? i : n.effect || i : t;
                "number" == typeof(n = n || {}) && (n = {
                    duration: n
                }), o = !e.isEmptyObject(n), n.complete = a, n.delay && s.delay(n.delay), o && e.effects && (e.effects.effect[u] || !1 !== e.uiBackCompat && e.effects[u]) ? s[t](n) : u !== t && s[u] ? s[u](n.duration, n.easing, a) : s.queue(function(i) {
                    e(this)[t](), a && a.call(s[0]), i()
                })
            }
        }), !1 !== e.uiBackCompat && (e.Widget.prototype._getCreateOptions = function() {
            return e.metadata && e.metadata.get(this.element[0])[this.widgetName]
        })
    }(jQuery),
    function(e, t) {
        var i = !1;
        e(document).mouseup(function(e) {
            i = !1
        }), e.widget("ui.mouse", {
            version: "1.9.2",
            options: {
                cancel: "input,textarea,button,select,option",
                distance: 1,
                delay: 0
            },
            _mouseInit: function() {
                var t = this;
                this.element.bind("mousedown." + this.widgetName, function(e) {
                    return t._mouseDown(e)
                }).bind("click." + this.widgetName, function(i) {
                    if (!0 === e.data(i.target, t.widgetName + ".preventClickEvent")) return e.removeData(i.target, t.widgetName + ".preventClickEvent"), i.stopImmediatePropagation(), !1
                }), this.started = !1
            },
            _mouseDestroy: function() {
                this.element.unbind("." + this.widgetName), this._mouseMoveDelegate && e(document).unbind("mousemove." + this.widgetName, this._mouseMoveDelegate).unbind("mouseup." + this.widgetName, this._mouseUpDelegate)
            },
            _mouseDown: function(t) {
                if (!i) {
                    this._mouseStarted && this._mouseUp(t), this._mouseDownEvent = t;
                    var s = this,
                        n = 1 === t.which,
                        a = !("string" != typeof this.options.cancel || !t.target.nodeName) && e(t.target).closest(this.options.cancel).length;
                    return !(n && !a && this._mouseCapture(t)) || (this.mouseDelayMet = !this.options.delay, this.mouseDelayMet || (this._mouseDelayTimer = setTimeout(function() {
                        s.mouseDelayMet = !0
                    }, this.options.delay)), this._mouseDistanceMet(t) && this._mouseDelayMet(t) && (this._mouseStarted = !1 !== this._mouseStart(t), !this._mouseStarted) ? (t.preventDefault(), !0) : (!0 === e.data(t.target, this.widgetName + ".preventClickEvent") && e.removeData(t.target, this.widgetName + ".preventClickEvent"), this._mouseMoveDelegate = function(e) {
                        return s._mouseMove(e)
                    }, this._mouseUpDelegate = function(e) {
                        return s._mouseUp(e)
                    }, e(document).bind("mousemove." + this.widgetName, this._mouseMoveDelegate).bind("mouseup." + this.widgetName, this._mouseUpDelegate), t.preventDefault(), i = !0, !0))
                }
            },
            _mouseMove: function(t) {
                return !e.ui.ie || document.documentMode >= 9 || t.button ? this._mouseStarted ? (this._mouseDrag(t), t.preventDefault()) : (this._mouseDistanceMet(t) && this._mouseDelayMet(t) && (this._mouseStarted = !1 !== this._mouseStart(this._mouseDownEvent, t), this._mouseStarted ? this._mouseDrag(t) : this._mouseUp(t)), !this._mouseStarted) : this._mouseUp(t)
            },
            _mouseUp: function(t) {
                return e(document).unbind("mousemove." + this.widgetName, this._mouseMoveDelegate).unbind("mouseup." + this.widgetName, this._mouseUpDelegate), this._mouseStarted && (this._mouseStarted = !1, t.target === this._mouseDownEvent.target && e.data(t.target, this.widgetName + ".preventClickEvent", !0), this._mouseStop(t)), !1
            },
            _mouseDistanceMet: function(e) {
                return Math.max(Math.abs(this._mouseDownEvent.pageX - e.pageX), Math.abs(this._mouseDownEvent.pageY - e.pageY)) >= this.options.distance
            },
            _mouseDelayMet: function(e) {
                return this.mouseDelayMet
            },
            _mouseStart: function(e) {},
            _mouseDrag: function(e) {},
            _mouseStop: function(e) {},
            _mouseCapture: function(e) {
                return !0
            }
        })
    }(jQuery),
    function(e, t) {
        e.widget("ui.slider", e.ui.mouse, {
            version: "1.9.2",
            widgetEventPrefix: "slide",
            options: {
                animate: !1,
                distance: 0,
                max: 100,
                min: 0,
                orientation: "horizontal",
                range: !1,
                step: 1,
                value: 0,
                values: null
            },
            _create: function() {
                var t, i, s = this.options,
                    n = this.element.find(".ui-slider-handle").addClass("ui-state-default ui-corner-all"),
                    a = [];
                for (this._keySliding = !1, this._mouseSliding = !1, this._animateOff = !0, this._handleIndex = null, this._detectOrientation(), this._mouseInit(), this.element.addClass("ui-slider ui-slider-" + this.orientation + " ui-widget ui-widget-content ui-corner-all" + (s.disabled ? " ui-slider-disabled ui-disabled" : "")), this.range = e([]), s.range && (!0 === s.range && (s.values || (s.values = [this._valueMin(), this._valueMin()]), s.values.length && 2 !== s.values.length && (s.values = [s.values[0], s.values[0]])), this.range = e("<div></div>").appendTo(this.element).addClass("ui-slider-range ui-widget-header" + ("min" === s.range || "max" === s.range ? " ui-slider-range-" + s.range : ""))), i = s.values && s.values.length || 1, t = n.length; t < i; t++) a.push("<a class='ui-slider-handle ui-state-default ui-corner-all' href='#'></a>");
                this.handles = n.add(e(a.join("")).appendTo(this.element)), this.handle = this.handles.eq(0), this.handles.add(this.range).filter("a").click(function(e) {
                    e.preventDefault()
                }).mouseenter(function() {
                    s.disabled || e(this).addClass("ui-state-hover")
                }).mouseleave(function() {
                    e(this).removeClass("ui-state-hover")
                }).focus(function() {
                    s.disabled ? e(this).blur() : (e(".ui-slider .ui-state-focus").removeClass("ui-state-focus"), e(this).addClass("ui-state-focus"))
                }).blur(function() {
                    e(this).removeClass("ui-state-focus")
                }), this.handles.each(function(t) {
                    e(this).data("ui-slider-handle-index", t)
                }), this._on(this.handles, {
                    keydown: function(t) {
                        var i, s, n, a = e(t.target).data("ui-slider-handle-index");
                        switch (t.keyCode) {
                            case e.ui.keyCode.HOME:
                            case e.ui.keyCode.END:
                            case e.ui.keyCode.PAGE_UP:
                            case e.ui.keyCode.PAGE_DOWN:
                            case e.ui.keyCode.UP:
                            case e.ui.keyCode.RIGHT:
                            case e.ui.keyCode.DOWN:
                            case e.ui.keyCode.LEFT:
                                if (t.preventDefault(), !this._keySliding && (this._keySliding = !0, e(t.target).addClass("ui-state-active"), !1 === this._start(t, a))) return
                        }
                        switch (n = this.options.step, i = s = this.options.values && this.options.values.length ? this.values(a) : this.value(), t.keyCode) {
                            case e.ui.keyCode.HOME:
                                s = this._valueMin();
                                break;
                            case e.ui.keyCode.END:
                                s = this._valueMax();
                                break;
                            case e.ui.keyCode.PAGE_UP:
                                s = this._trimAlignValue(i + (this._valueMax() - this._valueMin()) / 5);
                                break;
                            case e.ui.keyCode.PAGE_DOWN:
                                s = this._trimAlignValue(i - (this._valueMax() - this._valueMin()) / 5);
                                break;
                            case e.ui.keyCode.UP:
                            case e.ui.keyCode.RIGHT:
                                if (i === this._valueMax()) return;
                                s = this._trimAlignValue(i + n);
                                break;
                            case e.ui.keyCode.DOWN:
                            case e.ui.keyCode.LEFT:
                                if (i === this._valueMin()) return;
                                s = this._trimAlignValue(i - n)
                        }
                        this._slide(t, a, s)
                    },
                    keyup: function(t) {
                        var i = e(t.target).data("ui-slider-handle-index");
                        this._keySliding && (this._keySliding = !1, this._stop(t, i), this._change(t, i), e(t.target).removeClass("ui-state-active"))
                    }
                }), this._refreshValue(), this._animateOff = !1
            },
            _destroy: function() {
                this.handles.remove(), this.range.remove(), this.element.removeClass("ui-slider ui-slider-horizontal ui-slider-vertical ui-slider-disabled ui-widget ui-widget-content ui-corner-all"), this._mouseDestroy()
            },
            _mouseCapture: function(t) {
                var i, s, n, a, o, u, r, h = this,
                    l = this.options;
                return !l.disabled && (this.elementSize = {
                    width: this.element.outerWidth(),
                    height: this.element.outerHeight()
                }, this.elementOffset = this.element.offset(), i = {
                    x: t.pageX,
                    y: t.pageY
                }, s = this._normValueFromMouse(i), n = this._valueMax() - this._valueMin() + 1, this.handles.each(function(t) {
                    var i = Math.abs(s - h.values(t));
                    n > i && (n = i, a = e(this), o = t)
                }), !0 === l.range && this.values(1) === l.min && (o += 1, a = e(this.handles[o])), !1 !== this._start(t, o) && (this._mouseSliding = !0, this._handleIndex = o, a.addClass("ui-state-active").focus(), u = a.offset(), r = !e(t.target).parents().is(".ui-slider-handle"), this._clickOffset = r ? {
                    left: 0,
                    top: 0
                } : {
                    left: t.pageX - u.left - a.width() / 2,
                    top: t.pageY - u.top - a.height() / 2 - (parseInt(a.css("borderTopWidth"), 10) || 0) - (parseInt(a.css("borderBottomWidth"), 10) || 0) + (parseInt(a.css("marginTop"), 10) || 0)
                }, this.handles.hasClass("ui-state-hover") || this._slide(t, o, s), this._animateOff = !0, !0))
            },
            _mouseStart: function() {
                return !0
            },
            _mouseDrag: function(e) {
                var t = {
                        x: e.pageX,
                        y: e.pageY
                    },
                    i = this._normValueFromMouse(t);
                return this._slide(e, this._handleIndex, i), !1
            },
            _mouseStop: function(e) {
                return this.handles.removeClass("ui-state-active"), this._mouseSliding = !1, this._stop(e, this._handleIndex), this._change(e, this._handleIndex), this._handleIndex = null, this._clickOffset = null, this._animateOff = !1, !1
            },
            _detectOrientation: function() {
                this.orientation = "vertical" === this.options.orientation ? "vertical" : "horizontal"
            },
            _normValueFromMouse: function(e) {
                var t, i, s, n, a;
                return "horizontal" === this.orientation ? (t = this.elementSize.width, i = e.x - this.elementOffset.left - (this._clickOffset ? this._clickOffset.left : 0)) : (t = this.elementSize.height, i = e.y - this.elementOffset.top - (this._clickOffset ? this._clickOffset.top : 0)), (s = i / t) > 1 && (s = 1), s < 0 && (s = 0), "vertical" === this.orientation && (s = 1 - s), n = this._valueMax() - this._valueMin(), a = this._valueMin() + s * n, this._trimAlignValue(a)
            },
            _start: function(e, t) {
                var i = {
                    handle: this.handles[t],
                    value: this.value()
                };
                return this.options.values && this.options.values.length && (i.value = this.values(t), i.values = this.values()), this._trigger("start", e, i)
            },
            _slide: function(e, t, i) {
                var s, n, a;
                this.options.values && this.options.values.length ? (s = this.values(t ? 0 : 1), 2 === this.options.values.length && !0 === this.options.range && (0 === t && i > s || 1 === t && i < s) && (i = s), i !== this.values(t) && ((n = this.values())[t] = i, a = this._trigger("slide", e, {
                    handle: this.handles[t],
                    value: i,
                    values: n
                }), s = this.values(t ? 0 : 1), !1 !== a && this.values(t, i, !0))) : i !== this.value() && !1 !== (a = this._trigger("slide", e, {
                    handle: this.handles[t],
                    value: i
                })) && this.value(i)
            },
            _stop: function(e, t) {
                var i = {
                    handle: this.handles[t],
                    value: this.value()
                };
                this.options.values && this.options.values.length && (i.value = this.values(t), i.values = this.values()), this._trigger("stop", e, i)
            },
            _change: function(e, t) {
                if (!this._keySliding && !this._mouseSliding) {
                    var i = {
                        handle: this.handles[t],
                        value: this.value()
                    };
                    this.options.values && this.options.values.length && (i.value = this.values(t), i.values = this.values()), this._trigger("change", e, i)
                }
            },
            value: function(e) {
                return arguments.length ? (this.options.value = this._trimAlignValue(e), this._refreshValue(), void this._change(null, 0)) : this._value()
            },
            values: function(t, i) {
                var s, n, a;
                if (arguments.length > 1) return this.options.values[t] = this._trimAlignValue(i), this._refreshValue(), void this._change(null, t);
                if (!arguments.length) return this._values();
                if (!e.isArray(arguments[0])) return this.options.values && this.options.values.length ? this._values(t) : this.value();
                for (s = this.options.values, n = arguments[0], a = 0; a < s.length; a += 1) s[a] = this._trimAlignValue(n[a]), this._change(null, a);
                this._refreshValue()
            },
            _setOption: function(t, i) {
                var s, n = 0;
                switch (e.isArray(this.options.values) && (n = this.options.values.length), e.Widget.prototype._setOption.apply(this, arguments), t) {
                    case "disabled":
                        i ? (this.handles.filter(".ui-state-focus").blur(), this.handles.removeClass("ui-state-hover"), this.handles.prop("disabled", !0), this.element.addClass("ui-disabled")) : (this.handles.prop("disabled", !1), this.element.removeClass("ui-disabled"));
                        break;
                    case "orientation":
                        this._detectOrientation(), this.element.removeClass("ui-slider-horizontal ui-slider-vertical").addClass("ui-slider-" + this.orientation), this._refreshValue();
                        break;
                    case "value":
                        this._animateOff = !0, this._refreshValue(), this._change(null, 0), this._animateOff = !1;
                        break;
                    case "values":
                        for (this._animateOff = !0, this._refreshValue(), s = 0; s < n; s += 1) this._change(null, s);
                        this._animateOff = !1;
                        break;
                    case "min":
                    case "max":
                        this._animateOff = !0, this._refreshValue(), this._animateOff = !1
                }
            },
            _value: function() {
                var e = this.options.value;
                return e = this._trimAlignValue(e)
            },
            _values: function(e) {
                var t, i, s;
                if (arguments.length) return t = this.options.values[e], t = this._trimAlignValue(t);
                for (i = this.options.values.slice(), s = 0; s < i.length; s += 1) i[s] = this._trimAlignValue(i[s]);
                return i
            },
            _trimAlignValue: function(e) {
                if (e <= this._valueMin()) return this._valueMin();
                if (e >= this._valueMax()) return this._valueMax();
                var t = this.options.step > 0 ? this.options.step : 1,
                    i = (e - this._valueMin()) % t,
                    s = e - i;
                return 2 * Math.abs(i) >= t && (s += i > 0 ? t : -t), parseFloat(s.toFixed(5))
            },
            _valueMin: function() {
                return this.options.min
            },
            _valueMax: function() {
                return this.options.max
            },
            _refreshValue: function() {
                var t, i, s, n, a, o = this.options.range,
                    u = this.options,
                    r = this,
                    h = !this._animateOff && u.animate,
                    l = {};
                this.options.values && this.options.values.length ? this.handles.each(function(s) {
                    i = (r.values(s) - r._valueMin()) / (r._valueMax() - r._valueMin()) * 100, l["horizontal" === r.orientation ? "left" : "bottom"] = i + "%", e(this).stop(1, 1)[h ? "animate" : "css"](l, u.animate), !0 === r.options.range && ("horizontal" === r.orientation ? (0 === s && r.range.stop(1, 1)[h ? "animate" : "css"]({
                        left: i + "%"
                    }, u.animate), 1 === s && r.range[h ? "animate" : "css"]({
                        width: i - t + "%"
                    }, {
                        queue: !1,
                        duration: u.animate
                    })) : (0 === s && r.range.stop(1, 1)[h ? "animate" : "css"]({
                        bottom: i + "%"
                    }, u.animate), 1 === s && r.range[h ? "animate" : "css"]({
                        height: i - t + "%"
                    }, {
                        queue: !1,
                        duration: u.animate
                    }))), t = i
                }) : (s = this.value(), n = this._valueMin(), a = this._valueMax(), i = a !== n ? (s - n) / (a - n) * 100 : 0, l["horizontal" === this.orientation ? "left" : "bottom"] = i + "%", this.handle.stop(1, 1)[h ? "animate" : "css"](l, u.animate), "min" === o && "horizontal" === this.orientation && this.range.stop(1, 1)[h ? "animate" : "css"]({
                    width: i + "%"
                }, u.animate), "max" === o && "horizontal" === this.orientation && this.range[h ? "animate" : "css"]({
                    width: 100 - i + "%"
                }, {
                    queue: !1,
                    duration: u.animate
                }), "min" === o && "vertical" === this.orientation && this.range.stop(1, 1)[h ? "animate" : "css"]({
                    height: i + "%"
                }, u.animate), "max" === o && "vertical" === this.orientation && this.range[h ? "animate" : "css"]({
                    height: 100 - i + "%"
                }, {
                    queue: !1,
                    duration: u.animate
                }))
            }
        })
    }(jQuery);