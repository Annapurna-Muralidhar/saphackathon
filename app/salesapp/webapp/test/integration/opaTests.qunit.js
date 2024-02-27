sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'salesapp/test/integration/FirstJourney',
		'salesapp/test/integration/pages/SalesList',
		'salesapp/test/integration/pages/SalesObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesList, SalesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('salesapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesList: SalesList,
					onTheSalesObjectPage: SalesObjectPage
                }
            },
            opaJourney.run
        );
    }
);