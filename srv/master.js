const cds=require('@sap/cds')
module.exports = cds.service.impl(async function () {
    const { States, Business_Partner,Store,Product } = this.entities;
    this.on("READ", Business_Partner, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before("CREATE",  Business_Partner, async (req) => {
        const { Is_gstn_registered, Gst_num } = req.data;
        if (Is_gstn_registered && !Gst_num) {
            req.error({
                code: "MISSING_GST_NUM",
                message: "GSTIN number is mandatory when Is_gstn_registered is true",
                target: "Gst_num",
            });
        }
        const query1 = SELECT.from( Business_Partner).where({ bp_no: req.data.bp_no });
        const result = await cds.run(query1); // Execute the query using cds.run()
        if (result.length > 0) {
          req.error({
            code: "BPNOEXISTS",
            message: "Business Partner id already exists",
            target: "bp_no",
          });
        }
        
      });

      this.on("READ", Store, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
      this.before("CREATE",  Store, async (req) => {
        
        const query1 = SELECT.from( Store).where({ store_id: req.data.store_id });
        const result = await cds.run(query1);
        if (result.length > 0) {
          req.error({
            code: "STOREIDEXISTS",
            message: "Store id already exists",
            target: "store_id",
          });
        }
        
      });


      this.on("READ", Product, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
      this.before("CREATE",  Product, async (req) => {
        
        const query1 = SELECT.from( Product).where({ p_id: req.data.p_id });
        const result = await cds.run(query1);
        if (result.length > 0) {
          req.error({
            code: "PRODUCTIDEXISTS",
            message: "Product id already exists",
            target: "p_id",
          });
        }

        const { costPrice, sellPrice } = req.data;
        if(sellPrice<=costPrice){
          req.error({
            code: "INVALIDSELL",
            message: "Selling price cannot be less than cost price",
            target: "sellPrice",
          });

        }


        
      });





      this.on('READ',States,async(req)=>{
        genders=[
            {"code":"TS","description":"Telangana"},
            {"code":"AP","description":"Andra Pradesh"},
            {"code":"TN","description":"Tamil Nadu"},
        ]
        genders.$count=genders.length
        return genders;
    })
})