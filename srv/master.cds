using {com.test.hackathon as db} from '../db/schema';

service Market {
    entity Business_Partner as projection on db.Business_Partner;
    entity States           as projection on db.States;
    entity Store            as projection on db.Store;
    entity Product          as projection on db.Product;
    entity Stock            as projection on db.Stock;
    entity Purchase            as projection on db.Purchase;
    entity Sales            as projection on db.Sales;

   
}



annotate Market.Business_Partner with @odata.draft.enabled;
annotate Market.Store with @odata.draft.enabled;
annotate Market.Product with @odata.draft.enabled;
annotate Market.Stock with @odata.draft.enabled;
annotate Market.Purchase  with @odata.draft.enabled;
annotate Market.Sales with @odata.draft.enabled;




annotate Market.Business_Partner with {
    pinCode @assert.format: '^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$';
    Gst_num @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[Z]{1}[0-9]{1}$';
}

annotate Market.Store with {
    PinCode @assert.format: '^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$';
    
}

// annotate Market.Product with {
//     imageURL @assert.format: '^“((http|https)://)(www.)?” 
// + “[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]” 
// + “{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)”$';
    
// }

annotate Market.States with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: code
    },
    {
        $Type: 'UI.DataField',
        Value: description
    },
],

);

annotate Market.Business_Partner with @(
    UI.LineItem : [

        {
            Label: 'Bussiness Partner Id',
            Value: bp_no
        },
        {
            Label: 'Name',
            Value: name
        },
        {
            Label: 'Address 1',
            Value: add1
        },
        {
            Label: 'Address 2',
            Value: add2
        },
        {
            Label: 'City',
            Value: city
        },
        {
            Label: 'State',
            Value: state_code
        },
        {
            Label: 'Is GSTIN Registered',
            Value: Is_gstn_registered
        },
        {
            Label: 'GSTIN Number',
            Value: Gst_num
        },
         {
            Label: 'Is Vendor',
            Value: Is_vendor
        },
        {
            Label: 'Is Customer',
            Value: Is_customer
            
        }
        
    ],
    UI.FieldGroup #BusinessP: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Bussiness Partner Id',
                Value: bp_no
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Value: add1
            },
            {
                $Type: 'UI.DataField',
                Value: add2
            },
            {
                $Type: 'UI.DataField',
                Value: city
            },
            {
                $Type: 'UI.DataField',
                Value: pinCode
            },
            {
                $Type: 'UI.DataField',
                Value: state_code
            },
            {
                Value: Is_gstn_registered
            },
            {
                $Type: 'UI.DataField',
                Value: Gst_num
            },
        ],
    },
    UI.Facets               : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'BusinessPFacet',
        Label : 'BusinessP',
        Target: '@UI.FieldGroup#BusinessP',
    }, ],
);


annotate Market.Store with @(
    UI.LineItem         : [
        {
            Label: 'Store Id',
            Value: store_id
        },
        {
            Label: 'Store name',
            Value: name
        },
        {
            Label: 'Address 1',
            Value: add1
        },
        {
            Label: 'Address 2',
            Value: add2
        },
        {
            Label: 'City',
            Value: city
        },
        {
            Label: 'State',
            Value: state_code
        },
        {
            Label: 'Pin code',
            Value: PinCode 
        },
    ],
    UI.FieldGroup #store: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Store Id',
                Value: store_id
            },
            {
                Label: 'Store name',
                Value: name
            },
            {
                Label: 'Address 1',
                Value: add1
            },
            {
                Label: 'Address 2',
                Value: add2
            },
            {
                Label: 'City',
                Value: city
            },
            {
                Label: 'State',
                Value: state_code
            },
            {
                Label: 'Pin code',
                Value: PinCode
            },
        ],
    },
    UI.Facets           : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'storeFacet',
        Label : 'store facets',
        Target: '@UI.FieldGroup#store'
    }, ],
);


annotate Market.Product with @(
    UI.LineItem           : [
        {
            Label: 'Product id',
            Value: p_id
        },
        {
            Label: 'Product Name',
            Value: name
        },
        {
            Label: 'Product Image URL',
            Value: imageURL
        },
        {
            Label: 'Cost Price',
            Value: costPrice
        },
        {
            Label: 'Sell Price',
            Value: sellPrice
        },
    ],
    UI.FieldGroup #product: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Product id',
                Value: p_id
            },
            {
                Label: 'Product Name',
                Value: name
            },
            {
                Label: 'Product Image URL',
                Value: imageURL
            },
            {
                Label: 'Cost Price',
                Value: costPrice
            },
            {
                Label: 'Sell Price',
                Value: sellPrice
            },
        ],
    },
    UI.Facets             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'productFacet',
        Label : 'product facets',
        Target: '@UI.FieldGroup#product'
    }, ],

);

annotate Market.Purchase with @(
    UI.LineItem           : [
        {
            Value: pon
        },
        {
            Value: bp
        },
        {
            Value: pod
        },
        {
            Value: productID.ID
        },
        {
            Value: quantity.ID
        },
        {
            Value: price.ID
        },
        {
            Value: storeID.ID
        },
    ],
    UI.FieldGroup #purchase: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
            Value: pon
        },
        {
            Value: bp
        },
        {
            Value: pod
        },
         {
            Value: productID.ID
        },
        {
            Value: quantity.ID
        },
        {
            Value: price.ID
        },
        {
            Value: storeID.ID
        },
        ],
    },
    UI.Facets             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'purchaseFacet',
        Label : 'purchase facets',
        Target: '@UI.FieldGroup#purchase'
    }, ],

);


annotate Market.Sales with @(
    UI.LineItem           : [
        {
            Value: son
        },
        {
            Value: bp
        },
        {
            Value: sd
        },
         {
            Value: productID.ID
        },
        {
            Value: quantity.ID
        },
        {
            Value: price.ID
        },
        {
            Value: storeID.ID
        },
    ],
    UI.FieldGroup #sales: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
            Value: son
        },
        {
            Value: bp
        },
        {
            Value: sd
        },
         {
            Value: productID.ID
        },
        {
            Value: quantity.ID
        },
        {
            Value: price.ID
        },
        {
            Value: storeID.ID
        },
        ],
    },
    UI.Facets             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'salesFacet',
        Label : 'sales facets',
        Target: '@UI.FieldGroup#sales'
    }, ],

);


annotate Market.Business_Partner with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'State',
            CollectionPath: 'States',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: state_code,
                    ValueListProperty: 'code'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                },
            ]
        }
    );
};

annotate Market.Store with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'State',
            CollectionPath: 'States',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: state_code,
                    ValueListProperty: 'code'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                },
            ]
        }
    );
};

// annotate Market.Product with {
//   @Common.Text: '{Product}'
//   @Core.IsURL: true
//   @Core.MediaType: 'image/jpg'
//   imageURL;
// };




// annotate Transactional.Stock with {
//     storeId @(
//         Common.ValueListWithFixedValues: true,
//         Common.ValueList : {
//             Label: 'Store id',
//             CollectionPath : 'Store',
//             Parameters: [
//                 {
//                     $Type             : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : storeId_ID,
//                     ValueListProperty : 'ID'
//                 },
//                 {
//                     $Type             : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty : 'name'
//                 },
             
//             ]
//         }
//     );
// productId @(
//         Common.ValueListWithFixedValues: true,
//         Common.ValueList : {
//             Label: 'Product id',
//             CollectionPath : 'Product',
//             Parameters: [
//                 {
//                     $Type             : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : productId_ID,
//                     ValueListProperty : 'ID'
//                 },
//                 {
//                     $Type             : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty : 'name'
//                 },
             
//             ]
//         }
//     );
// }

annotate Market.Stock with @(
    UI.LineItem:[
        {
            Label:'Store Id',
            Value:storeId_ID
        },
         {
            Label:'Product Id',
            Value:productId_ID
        },
        {
            Label:'Stock Quantity',
            Value:stock_qty
        }
    ],
    UI.FieldGroup #stock :{
        $Type:'UI.FieldGroupType',
        Data:[
             {
            Label:'Store Id',
            Value:storeId_ID
        },
         {
            Label:'Product Id',
            Value:productId_ID
        },
         {
            Label:'Stock Quantity',
            Value:stock_qty
        }
        ],
    },
      UI.Facets:[
        {
            $Type:'UI.ReferenceFacet',
            ID:'stockFacet',
            Label:'stock facets',
            Target:'@UI.FieldGroup#stock'
        },
    ],
);