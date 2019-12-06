!function(e){"use strict";var t=function(){this.$body=e("body"),this.$window=e(window)};t.prototype.initMaxLength=function(){e("input#defaultconfig").maxlength({warningClass:"badge badge-success",limitReachedClass:"badge badge-danger"}),e("input#thresholdconfig").maxlength({threshold:20,warningClass:"badge badge-success",limitReachedClass:"badge badge-danger"}),e("input#alloptions").maxlength({alwaysShow:!0,separator:" out of ",preText:"You typed ",postText:" chars available.",validate:!0,warningClass:"badge badge-success",limitReachedClass:"badge badge-danger"}),e("textarea#textarea").maxlength({alwaysShow:!0,warningClass:"badge badge-success",limitReachedClass:"badge badge-danger"}),e("input#placement").maxlength({alwaysShow:!0,placement:"top-left",warningClass:"badge badge-success",limitReachedClass:"badge badge-danger"})},t.prototype.initTimePicker=function(){jQuery("#timepicker").timepicker({defaultTIme:!1,icons:{up:"mdi mdi-chevron-up",down:"mdi mdi-chevron-down"}}),jQuery("#timepicker2").timepicker({showMeridian:!1,icons:{up:"mdi mdi-chevron-up",down:"mdi mdi-chevron-down"}}),jQuery("#timepicker3").timepicker({minuteStep:10,icons:{up:"mdi mdi-chevron-up",down:"mdi mdi-chevron-down"}})},t.prototype.initColorPicker=function(){e(".colorpicker-default").colorpicker({format:"hex"}),e(".colorpicker-rgba").colorpicker()},t.prototype.initMask=function(){e(".date").mask("00/00/0000"),e(".time").mask("00:00:00"),e(".date_time").mask("00/00/0000 00:00:00"),e(".cep").mask("00000-000"),e(".crazy_cep").mask("0-00-00-00"),e(".phone").mask("0000-0000"),e(".phone_with_ddd").mask("(00) 0000-0000"),e(".phone_us").mask("(000) 000-0000"),e(".mixed").mask("AAA 000-S0S"),e(".cpf").mask("000.000.000-00",{reverse:!0}),e(".cnpj").mask("00.000.000/0000-00",{reverse:!0}),e(".money").mask("000.000.000.000.000,00",{reverse:!0}),e(".money2").mask("#.##0,00",{reverse:!0}),e(".ip_address").mask("099.099.099.099"),e(".percent").mask("##0,00%",{reverse:!0})},t.prototype.initDatePicker=function(){jQuery("#datepicker").datepicker(),jQuery("#datepicker-autoclose").datepicker({autoclose:!0,todayHighlight:!0}),jQuery("#datepicker-inline").datepicker(),jQuery("#datepicker-multiple-date").datepicker({format:"mm/dd/yyyy",clearBtn:!0,multidate:!0,multidateSeparator:","}),jQuery("#date-range").datepicker({toggleActive:!0})},t.prototype.initDateRangePicker=function(){e(".input-daterange-datepicker").daterangepicker({buttonClasses:["btn","btn-sm"],applyClass:"btn-success",cancelClass:"btn-light"}),e(".input-daterange-timepicker").daterangepicker({timePicker:!0,timePickerIncrement:30,locale:{format:"MM/DD/YYYY h:mm A"},buttonClasses:["btn","btn-sm"],applyClass:"btn-success",cancelClass:"btn-light"}),e(".input-limit-datepicker").daterangepicker({format:"MM/DD/YYYY",minDate:"06/01/2018",maxDate:"06/30/2018",buttonClasses:["btn","btn-sm"],applyClass:"btn-success",cancelClass:"btn-light",dateLimit:{days:6}}),e("#reportrange span").html(moment().subtract(29,"days").format("MMMM D, YYYY")+" - "+moment().format("MMMM D, YYYY")),e("#reportrange").daterangepicker({format:"MM/DD/YYYY",startDate:moment().subtract(29,"days"),endDate:moment(),minDate:"01/01/2017",maxDate:"12/31/2020",dateLimit:{days:60},showDropdowns:!0,showWeekNumbers:!1,timePicker:!1,timePickerIncrement:1,timePicker12Hour:!0,ranges:{Today:[moment(),moment()],Yesterday:[moment().subtract(1,"days"),moment().subtract(1,"days")],"Last 7 Days":[moment().subtract(6,"days"),moment()],"Last 30 Days":[moment().subtract(29,"days"),moment()],"This Month":[moment().startOf("month"),moment().endOf("month")],"Last Month":[moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")]},opens:"left",drops:"down",buttonClasses:["btn","btn-sm"],applyClass:"btn-success",cancelClass:"btn-light",separator:" to ",locale:{applyLabel:"Submit",cancelLabel:"Cancel",fromLabel:"From",toLabel:"To",customRangeLabel:"Custom",daysOfWeek:["Su","Mo","Tu","We","Th","Fr","Sa"],monthNames:["January","February","March","April","May","June","July","August","September","October","November","December"],firstDay:1}},function(t,a,n){console.log(t.toISOString(),a.toISOString(),n),e("#reportrange span").html(t.format("MMMM D, YYYY")+" - "+a.format("MMMM D, YYYY"))})},t.prototype.init=function(){this.initTimePicker(),this.initColorPicker(),this.initMask(),this.initDatePicker(),this.initDateRangePicker()},e.AdvanceFormApp=new t,e.AdvanceFormApp.Constructor=t}(window.jQuery),function(e){"use strict";window.jQuery.AdvanceFormApp.init()}();! function(e) {
    "use strict";
    var t = function() {
        this.$body = e("body"), this.$window = e(window)
    };
    t.prototype.initSelect2 = function() {
        e(".select2").select2(), e(".select2-limiting").select2({
            maximumSelectionLength: 2
        })
    }, t.prototype.initMaxLength = function() {
        e("input#defaultconfig").maxlength({
            warningClass: "badge badge-success",
            limitReachedClass: "badge badge-danger"
        }), e("input#thresholdconfig").maxlength({
            threshold: 20,
            warningClass: "badge badge-success",
            limitReachedClass: "badge badge-danger"
        }), e("input#alloptions").maxlength({
            alwaysShow: !0,
            separator: " out of ",
            preText: "You typed ",
            postText: " chars available.",
            validate: !0,
            warningClass: "badge badge-success",
            limitReachedClass: "badge badge-danger"
        }), e("textarea#textarea").maxlength({
            alwaysShow: !0,
            warningClass: "badge badge-success",
            limitReachedClass: "badge badge-danger"
        }), e("input#placement").maxlength({
            alwaysShow: !0,
            placement: "top-left",
            warningClass: "badge badge-success",
            limitReachedClass: "badge badge-danger"
        })
    }, t.prototype.initTimePicker = function() {
        jQuery("#timepicker").timepicker({
            defaultTIme: !1,
            icons: {
                up: "mdi mdi-chevron-up",
                down: "mdi mdi-chevron-down"
            }
        }), jQuery("#timepicker2").timepicker({
            showMeridian: !1,
            icons: {
                up: "mdi mdi-chevron-up",
                down: "mdi mdi-chevron-down"
            }
        }), jQuery("#timepicker3").timepicker({
            minuteStep: 10,
            icons: {
                up: "mdi mdi-chevron-up",
                down: "mdi mdi-chevron-down"
            }
        })
    }, t.prototype.initColorPicker = function() {
        e(".colorpicker-default").colorpicker({
            format: "hex"
        }), e(".colorpicker-rgba").colorpicker()
    }, t.prototype.initMask = function() {
        e(".date").mask("00/00/0000"), e(".time").mask("00:00:00"), e(".date_time").mask("00/00/0000 00:00:00"), e(".cep").mask("00000-000"), e(".crazy_cep").mask("0-00-00-00"), e(".phone").mask("0000-0000"), e(".phone_with_ddd").mask("(00) 0000-0000"), e(".phone_us").mask("(000) 000-0000"), e(".mixed").mask("AAA 000-S0S"), e(".cpf").mask("000.000.000-00", {
            reverse: !0
        }), e(".cnpj").mask("00.000.000/0000-00", {
            reverse: !0
        }), e(".money").mask("000.000.000.000.000,00", {
            reverse: !0
        }), e(".money2").mask("#.##0,00", {
            reverse: !0
        }), e(".ip_address").mask("099.099.099.099"), e(".percent").mask("##0,00%", {
            reverse: !0
        })
    }, t.prototype.initDatePicker = function() {
        jQuery("#datepicker").datepicker(), jQuery("#datepicker-autoclose").datepicker({
            autoclose: !0,
            todayHighlight: !0
        }), jQuery("#datepicker-inline").datepicker(), jQuery("#datepicker-multiple-date").datepicker({
            format: "mm/dd/yyyy",
            clearBtn: !0,
            multidate: !0,
            multidateSeparator: ","
        }), jQuery("#date-range").datepicker({
            toggleActive: !0
        })
    }, t.prototype.initDateRangePicker = function() {
        e(".input-daterange-datepicker").daterangepicker({
            buttonClasses: ["btn", "btn-sm"],
            applyClass: "btn-success",
            cancelClass: "btn-light"
        }), e(".input-daterange-timepicker").daterangepicker({
            timePicker: !0,
            timePickerIncrement: 30,
            locale: {
                format: "MM/DD/YYYY h:mm A"
            },
            buttonClasses: ["btn", "btn-sm"],
            applyClass: "btn-success",
            cancelClass: "btn-light"
        }), e(".input-limit-datepicker").daterangepicker({
            format: "MM/DD/YYYY",
            minDate: "06/01/2018",
            maxDate: "06/30/2018",
            buttonClasses: ["btn", "btn-sm"],
            applyClass: "btn-success",
            cancelClass: "btn-light",
            dateLimit: {
                days: 6
            }
        }), e("#reportrange span").html(moment().subtract(29, "days").format("MMMM D, YYYY") + " - " + moment().format("MMMM D, YYYY")), e("#reportrange").daterangepicker({
            format: "MM/DD/YYYY",
            startDate: moment().subtract(29, "days"),
            endDate: moment(),
            minDate: "01/01/2017",
            maxDate: "12/31/2020",
            dateLimit: {
                days: 60
            },
            showDropdowns: !0,
            showWeekNumbers: !1,
            timePicker: !1,
            timePickerIncrement: 1,
            timePicker12Hour: !0,
            ranges: {
                Today: [moment(), moment()],
                Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
                "Last 7 Days": [moment().subtract(6, "days"), moment()],
                "Last 30 Days": [moment().subtract(29, "days"), moment()],
                "This Month": [moment().startOf("month"), moment().endOf("month")],
                "Last Month": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
            },
            opens: "left",
            drops: "down",
            buttonClasses: ["btn", "btn-sm"],
            applyClass: "btn-success",
            cancelClass: "btn-light",
            separator: " to ",
            locale: {
                applyLabel: "Submit",
                cancelLabel: "Cancel",
                fromLabel: "From",
                toLabel: "To",
                customRangeLabel: "Custom",
                daysOfWeek: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
                monthNames: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                firstDay: 1
            }
        }, function(t, a, n) {
            console.log(t.toISOString(), a.toISOString(), n), e("#reportrange span").html(t.format("MMMM D, YYYY") + " - " + a.format("MMMM D, YYYY"))
        })
    }, t.prototype.init = function() {
        this.initSelect2(), this.initMaxLength(), this.initTimePicker(), this.initColorPicker(), this.initMask(), this.initDatePicker(), this.initDateRangePicker()
    }, e.AdvanceFormApp = new t, e.AdvanceFormApp.Constructor = t
}(window.jQuery),
function(e) {
    "use strict";
    window.jQuery.AdvanceFormApp.init()
}();