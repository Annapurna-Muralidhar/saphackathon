namespace com.test.hackathon;
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

  // stores:Composition of many Stock on stores.storeId = $self;
  //stores: Association to Stock on stores.storeId = $self.ID;


  // storeId : Composition of many Stock on storeId.stID=$self.ID;
  // stid:Composition of many Purchase on stid.stID=$self.ID;
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

   //products:Composition of many Stock on products.productId = $self;
   //products: Association to Stock on products.productId = $self.ID;

       // Composition with ChildEntity
    // pid: Composition of many Purchase on pid.pID = $self.ID;

    // sp: Composition of many Purchase on sp.pID = $self.ID;
    // cp:Composition of many Purchase on cp.pID = $self.ID;

    // productID:Composition of many Stock on productID.pID=$self.ID;
}



@cds.persistence.skip
entity States {
    @title:'code'
    key code: String(3);
    @title:'description'
    description:String(10);
    
}


entity Stock {
    key ID            : UUID;
    stID:UUID;
    storeId         : Association to Store;
    pID:UUID;
    productId       : Association to Product;
    stock_qty        : Integer;

   // Composition with ChildEntity
    // stk: Composition of many Purchase on stk.sID = $self.ID;

}


entity Purchase{

    @title:'Purchase Order Number'
    key pon: Integer;
    @title:'Business Partner'
    bp:String(10);
    @title:'Purchase Order Date'
    pod: Date;
    @title:'Product ID'
    // pid:Composition of many Product on p_id.p_id = $self;
   productID:Composition of many {
    key ID:UUID;
    pid : Association to Product ;
   }
    // pID:UUID;
    // pid : Association to Product on pid.ID =$self.pID;
  //parent: Association to ParentEntity on parent.ID = $self.parentID;

  @title:'Quantity'
  quantity:Composition of many{
    key  ID:UUID;
   stk : Association to Product;
  }
  // sID:UUID;
  // stk : Association to Product on stk.ID =$self.pID;
  @title:'Price'
  price:Composition of many{
     key  ID:UUID;
    sp: Association to Product;
  }
  //sp: Association to Product on sp.ID=$self.pID;
  @title:'Store ID'
  // stID:UUID;
  // stid:Association to Store on stid.ID=$self.stID;
  storeID:Composition of many{
     key  ID:UUID;
    stid:Association to Store;
  }


}

entity Sales{

    @title:'Sales Order Number'
    key son: Integer;
    @title:'Business Partner'
    bp:String(10);
    @title:'Sales Date'
    key sd: Date;
    @title:'Product ID'
    // pid:Composition of many Product on p_id.p_id = $self;

    productID:Composition of many {
    key ID:UUID;
    pid : Association to Product ;
   }
  //parent: Association to ParentEntity on parent.ID = $self.parentID;

  @title:'Quantity'
   quantity:Composition of many{
    key  ID:UUID;
   stk : Association to Product;
  }
  @title:'Price '
   price:Composition of many{
     key  ID:UUID;
    sp: Association to Product;
  }
  @title:'Store ID'
  storeID:Composition of many{
     key  ID:UUID;
    stid:Association to Store;
  }


}