namespace com.test.sdb;
using {cuid} from '@sap/cds/common';
@assert.unique:{
    bp_no:[bp_no]
}
entity Business_Partner {
    key ID: UUID;
    bp_no:String(6);
    @title:'Name'
    name:String(20);
 @title:'Address 1'
    add1:String(70);
 @title:'Address 2'
    add2:String(70);
    @title:'City'
    city:String(20);
     @title:'State'
    state:Association to States;
     @title:'pin code'
    pinCode:String(10);
    @title:' Is_gstn_registered'
     Is_gstn_registered:Boolean default false;
       @title:' GSTIN number'
     Gst_num:String(20);
       @title:' is vendor'
    Is_vendor:Boolean default false;
      @title:' is customer'
    Is_customer:Boolean default false;
}



entity Store {
    key ID: UUID;
    store_id :String(10);
    @title:'Name'
    name         : String(100);
    @title:'Address 1'
    add1     : String(255);
     @title:'Address 2'
    add2     : String(255);
    @title:'City'
    city         : String(100);
    @title:'State'
    state        : Association to States;
    @title:'pin code'
    PinCode      : String(10);
}

entity Product {
    key ID: UUID;
    p_id           : String(20); 
    @title:'Name'
    name     : String(100);
    @title:'Image'
    imageURL        : String(2000);
    @title:'Cost Price'
    costPrice       : Decimal(15, 2); 
    @title:'Selling Price'
    sellPrice       : Decimal(15, 2); 
}


// entity Stock {
//     key ID            : UUID;
//     storeId         : Association to Store;
//     productId       : Association to Product;
//     stock_qty        : Integer;
// }


@cds.persistence.skip
entity States {
    @title:'code'
    key code: String(3);
    @title:'description'
    description:String(10);
    
}