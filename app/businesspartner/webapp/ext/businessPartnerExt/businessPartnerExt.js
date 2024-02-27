sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        Is_vendor: function(oBindingContext,aSelectedContexts) {
            aSelectedContexts.forEach(element => {
                MessageToast.show(element.sPath);
                var aData = jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: "/odata/v4/market/"+element.sPath,
                    data: JSON.stringify({Is_vendor:true})
                }).then(element.requestRefresh());
            });
        },
        Is_not_vendor: function(oBindingContext,aSelectedContexts) {
            aSelectedContexts.forEach(element => {
                MessageToast.show(element.sPath);
                var aData = jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: "/odata/v4/market/"+element.sPath,
                    data: JSON.stringify({Is_vendor:false})
                }).then(element.requestRefresh());
            });
        },
        Is_customer: function(oBindingContext,aSelectedContexts) {
            aSelectedContexts.forEach(element => {
                MessageToast.show(element.sPath);
                var aData = jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: "/odata/v4/market/"+element.sPath,
                    data: JSON.stringify({Is_customer:true})
                }).then(element.requestRefresh());
            });
        },
        Is_not_customer: function(oBindingContext,aSelectedContexts) {
            aSelectedContexts.forEach(element => {
                MessageToast.show(element.sPath);
                var aData = jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: "/odata/v4/market/"+element.sPath,
                    data: JSON.stringify({Is_customer:false})
                }).then(element.requestRefresh());
            });
        }
    };
});
