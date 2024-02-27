using {com.test.hackathon as db} from '../db/schema';

service Market {
    entity Business_Partner as projection on db.Business_Partner;
    entity States           as projection on db.States;
    entity Store            as projection on db.Store;
    entity Product          as projection on db.Product;
    entity Stock            as projection on db.Stock;
    entity Purchase         as projection on db.Purchase;
    entity Sales            as projection on db.Sales;
    //entity Items         as projection on db.Items;


   
}



annotate Market.Business_Partner with @odata.draft.enabled;
annotate Market.Store with @odata.draft.enabled;
annotate Market.Product with @odata.draft.enabled;
annotate Market.Stock with @odata.draft.enabled;
annotate Market.Purchase  with @odata.draft.enabled;
//annotate Market.Sales with @odata.draft.enabled;




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
    }, ]
  

);

annotate Market.Purchase with @(
    UI.LineItem           : [
        {
            Label: 'Purchase order number',
            Value: pon
        },
        {
            Label: 'Business Partner',
            Value: bp_ID
        },
        {
            Label: 'Purchase order Date',
            Value: pod
        },
        // {
        //     Label: 'Product ID',
        //     Value: productID.ID
        // },
        // {
        //     Label: 'Quantity',
        //     Value: quantity.ID
        // },
        // {
        //     Label: 'Price',
        //     Value: price.ID
        // },
        // {
        //     Label: 'Store ID',
        //     Value: storeID.ID
        // },
    ],
    UI.FieldGroup #purchase: {
        $Type: 'UI.FieldGroupType',
        Data : [
       {
            Label: 'Purchase order number',
            Value: pon
        },
        {
            Label: 'Business Partner',
            Value: bp_ID
        },
        {
            Label: 'Purchase order Date',
            Value: pod
        },
        // {
        //     Label: 'Product ID',
        //     Value: productID.ID
        // },
        // {
        //     Label: 'Quantity',
        //     Value: quantity.ID
        // },
        // {
        //     Label: 'Price',
        //     Value: price.ID
        // },
        // {
        //     Label: 'Store ID',
        //     Value: storeID.ID
        // },
        ],
    },
    UI.Facets             : [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'purchaseFacet',
        Label : 'purchase facets',
        Target: '@UI.FieldGroup#purchase'
    }, 
    
   
    {
        $Type : 'UI.ReferenceFacet',
        ID:'productIdFacet',
        Label:'Product ID',
        Target : 'productID/@UI.LineItem',
    },
    {
        $Type : 'UI.ReferenceFacet',
        ID:'quantityFacet',
        Label:'Quantity',
        Target : 'quantity/@UI.LineItem',
    },
    {
        $Type : 'UI.ReferenceFacet',
        ID:'priceFacet',
        Label:'Price',
        Target : 'price/@UI.LineItem',
    },
    {
        $Type : 'UI.ReferenceFacet',
        ID:'storeidFacet',
        Label:'Store ID',
        Target : 'storeID/@UI.LineItem',
    },
    
    ],

);




annotate Market.Sales with @(
    UI.LineItem           : [
        {
            Value: son
        },
        {
            Value: bp_ID
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
            Value: bp_ID
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







annotate Transactional.Stock with {
    storeId @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store id',
            CollectionPath : 'Store',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : storeId_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
             
            ]
        }
    );
productId @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product id',
            CollectionPath : 'Product',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : productId_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
             
            ]
        }
    );
}

annotate Market.Stock with @(
    UI.LineItem:[
        {
            Label:'Store Id',
            Value:storeID_ID
        },
         {
            Label:'Product Id',
            Value:productID_ID
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
            Value:storeID_ID
        },
         {
            Label:'Product Id',
            Value:productID_ID
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

annotate Market.Product with {
  @Common.Text : '{Product}'
  @Core.IsURL : true
  @Core.MediaType : 'image/jpg'
  imageURL
};

annotate Market.Stock with {

    storeID @(
        Common.Text: storeID.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'storeIDs',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : storeID_ID,
                    ValueListProperty : 'ID'
                }
               
           
            ]
        }
    );
    productID @(
        Common.Text: productID.p_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'productIDs',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : productID_ID,
                    ValueListProperty : 'ID'
                }
               
           
            ]
        }
    )

};


annotate Market.Purchase with {

    bp @(
        Common.Text: bp.bp_no,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'bps',
            CollectionPath : 'Business_Partner',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bp_ID,
                    ValueListProperty : 'ID'
                }
               
           
            ]
        }
    );


};

annotate Market.Sales with {

    bp @(
        Common.Text: bp.bp_no,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'bps',
            CollectionPath : 'Business_Partner',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bp_ID,
                    ValueListProperty : 'ID'
                }
               
           
            ]
        }
    );


};


annotate Market.Purchase.productID with @(
    UI.LineItem:[
        {
            Label:'ProductID',
            Value:pid_ID
        },
    ],
    UI.FieldGroup #productids : {
        $Type:'UI.FieldGroupType',
        Data:[
            {
                 Value:pid_ID,
            }
           
        ],

    },
    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            ID:'productIdFacet',
            Label:'Product ID',
            Target:'@UI.FieldGroup#productids'

        },
        
    ],
);

annotate Market.Purchase.productID with {
    pid @(
        Common.Text: pid.p_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Languages',
            CollectionPath : 'Product',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : pid_ID,
                    ValueListProperty : 'ID'
                }
           
            ]
        }
    )};



    





    annotate Market.Purchase.quantity with @(
    UI.LineItem:[
        {
            Label:'ProductID',
            Value:stk_ID
        },
    ],
    UI.FieldGroup #quantity : {
        $Type:'UI.FieldGroupType',
        Data:[
            {
                 Value:stk_ID,
            }
           
        ],

    },
    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            ID:'qquantityFacet',
            Label:'Quantity',
            Target:'@UI.FieldGroup#quantity'

        },
        
    ],
);

annotate Market.Purchase.quantity with {
    stk @(
        Common.Text: stk.stock_qty,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Quantity',
            CollectionPath : 'Stock',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : stk_ID,
                    ValueListProperty : 'ID'
                }
           
            ]
        }
    )};



    








    annotate Market.Purchase.price with @(
    UI.LineItem:[
        {
            Label:'ProductID',
            Value:sp_ID
        },
    ],
    UI.FieldGroup #price : {
        $Type:'UI.FieldGroupType',
        Data:[
            {
                 Value:sp_ID,
            }
           
        ],

    },
    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            ID:'priceFacet',
            Label:'Price',
            Target:'@UI.FieldGroup#price'

        },
        
    ],
);

annotate Market.Purchase.price with {
    sp @(
        Common.Text: sp.sellPrice,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Price',
            CollectionPath : 'Product',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : sp_ID,
                    ValueListProperty : 'ID'
                }
           
            ]
        }
    )};







 annotate Market.Purchase.storeID with @(
    UI.LineItem:[
        {
            Label:'ProductID',
            Value:stid_ID
        },
    ],
    UI.FieldGroup #storeID : {
        $Type:'UI.FieldGroupType',
        Data:[
            {
                 Value:stid_ID,
            }
           
        ],

    },
    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            ID:'storeidFacet',
            Label:'Store ID',
            Target:'@UI.FieldGroup#storeID'

        },
        
    ],
);

annotate Market.Purchase.storeID with {
    stid @(
        Common.Text: stid.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store ID',
            CollectionPath : 'Store',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : stid_ID,
                    ValueListProperty : 'ID'
                }
           
            ]
        }
    )};   

// annotate Market.Items with @(
//     UI.LineItem:[
//         {
//             Value: pid_ID
//         },
//         {
//             Value:stk_ID
//         },
//         {
//             Value:sp_ID
//         },
//         {
//             Value:stid_ID
//         },
//     ],
//      UI.FieldGroup #Items : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//         {
//             Value: pid_ID
//         },
//         {
//             Value:stk_ID
//         },
//         {
//             Value:sp_ID
//         },
//         {
//             Value:stid_ID
//         },
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'itemsFacet',
//             Label : 'Items',
//             Target : '@UI.FieldGroup#Items',
//         },
//     ],

// );

