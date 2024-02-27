sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'purchaseapp/test/integration/FirstJourney',
		'purchaseapp/test/integration/pages/PurchaseList',
		'purchaseapp/test/integration/pages/PurchaseObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseList, PurchaseObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('purchaseapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseList: PurchaseList,
					onThePurchaseObjectPage: PurchaseObjectPage
                }
            },
            opaJourney.run
        );
    }
);