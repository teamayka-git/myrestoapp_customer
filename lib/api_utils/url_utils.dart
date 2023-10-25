class UrlUtils {
  /* Live
  String releasedDate = "[11-08-2023]";
  String releasedString = "Production";
  String baseUrl = "https://ajcjewel.com:4000/api/";
  String s3BucketMainUrl =
      "https://ajc-gold-erp-official.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d1n1v65zmbl223.cloudfront.net";
  */
  /* Testing
  String releasedDate = "[11-08-2023]";
  String releasedString = "Test production1";
  String baseUrl = "https://api.ai-projects.in/api/";
  String s3BucketMainUrl = "https://ayka-gold-erp.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d31danrxwfsdiw.cloudfront.net";
   */

  /* production Sign
  String releasedDate = "[11-08-2023]";
  String releasedString = "Sign";
  String baseUrl = "https://restaurentapi.nexteons.com/api/";
  String s3BucketMainUrl = "https://ayka-gold-erp.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d31danrxwfsdiw.cloudfront.net";
   */

  /* production HOMER Bangrole
  String releasedDate = "[11-08-2023]";
  String releasedString = "HOMER Bangrole";
  String baseUrl = "https://homerapi.nexteons.com/api/";
  String s3BucketMainUrl = "https://ayka-gold-erp.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d31danrxwfsdiw.cloudfront.net";
   */

  /* production HOMER Palakkad
  String releasedDate = "[11-08-2023]";
  String releasedString = "HOMER Palakkad";
  String baseUrl = "https://homerpkdapi.nexteons.com/api/";
  String s3BucketMainUrl = "https://ayka-gold-erp.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d31danrxwfsdiw.cloudfront.net";
   */

  /* production MISB kadungathukundu
  String releasedDate = "[11-08-2023]";
  String releasedString = "MISB kadungathukundu";
  String baseUrl = "https://misbapi.nexteons.com/api/";
  String s3BucketMainUrl = "https://ayka-gold-erp.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d31danrxwfsdiw.cloudfront.net";
   */

  /* production SaasFZ Faizalka
  String releasedDate = "[11-08-2023]";
  String releasedString = "SaasFZ";
  String baseUrl = "https://saasfzapi.nexteons.com/api/";
  String s3BucketMainUrl = "https://ayka-gold-erp.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d31danrxwfsdiw.cloudfront.net";
   */

  // /* production Demo
  String releasedDate = "[25-10-2023]";
  String releasedString = "Demo";
  String baseUrl = "https://nextdinedemo.nexteons.com/api/";
  String s3BucketMainUrl = "https://ayka-gold-erp.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d31danrxwfsdiw.cloudfront.net";
  //  */

  /* production Darwish
  String releasedDate = "[24-08-2023]";
  String releasedString = "Dw demo";
  String baseUrl = "https://saasdarwishapi.nexteons.com/api/";
  String s3BucketMainUrl = "https://ayka-gold-erp.s3.ap-south-1.amazonaws.com";
  String s3BucketCloudFormationUrl = "https://d31danrxwfsdiw.cloudfront.net";
  //  */





var bearerToken="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmltYXJ5c2lkIjoiMiIsImVtYWlsIjoiZ3Vlc3RAZ21haWwuY29tIiwidW5pcXVlX25hbWUiOiJHdWVzdCBVc2VyIiwiRW1haWwiOiJndWVzdEBnbWFpbC5jb20iLCJJZCI6IjIiLCJuYmYiOjE2OTQ0MTYyOTksImV4cCI6MTcyNTk1MjI5OSwiaWF0IjoxNjk0NDE2Mjk5fQ.3FPXa8kzkYu3-mSAeVicPJ8Hj2BUIkczYLZK1o759w0";










  String login = "Users/Login";
  String me = "Users/Me";

  String getProductData = "Products/GetProductDetailsByCategories";
  String orderCreate = "SalesOrder/SaveSalesOrder";
  String editCreate = "SalesOrder/UpdateSalesOrder";
  String getOrderDetails = "SalesOrder/GetOrderDetails";
  String getCustomer = "Customer/GetCustomers";
  String updateOrderStatus = "SalesOrder/UpdateOrderStatus";
  String updateOrderStatusByOrderNumber =
      "SalesOrder/UpdateOrderStatusByOrderNumber";

  String dayCloseReport = "Report/GetDayCloseReport";

//MASTERS
  String categoryCreate = "Categories/SaveCategories";
  String categoryList = "Categories/GetCategories";
  String categoryEdit = "Categories/UpdateCategories";
  String categoryStatusUpdate = "Categories/UpdateStatus";

  String userCreate = "Users/CreateUser";
  String userList = "Users/GetUserDetails";
  String userEdit = "Users/UpdateUser";
  String userUpdateStatus = 'Users/UpdateStatus';

  String tableCreate = "Tables/SaveTables";
  String tableList = "Tables/GetTables";
  String tableEdit = "Tables/UpdateTable";
  String tableBulkImport = "Tables/TableBulkImport";
  String tableStatusUpdate = "Tables/UpdateStatus";

  String kitchenCreate = "Kitchen/SaveKitchenMaster";
  String kitchenList = "Kitchen/GetKitchenMaster";
  String kitchenEdit = "Kitchen/UpdateKitchenMaster";
  String kitchenUpdate = "Kitchen/UpdateStatus";
  String getKitchanAnalysis = "Report/GetKitchenAnalysisReport";

  String variantCreate = "Variant/SaveVariants";
  String variantEdit = "Variant/UpdateVariants";
  String variantList = "Variant/GetVariants";
  String variantStatusUpdate = 'Variant/UpdateStatus';

  String propertyCreate = "Properties/SaveProductProperties";
  String propertyList = "Properties/GetproductProperties";
  String propertyEdit = "Properties/UpdateProductProperties";
  String propertyStatusUpdate = "Properties/UpdateStatus";

  String taxCreate = "TaxScheme/SaveTaxScheme";
  String taxList = "TaxScheme/GetTaxSchemes";
  String taxEdit = "TaxScheme/UpdateTaxScheme";

  String productList = "Products/GetProductDetails"; ////////////
  String productCreate = "Products/SaveProduct";
  String productEdit = "Products/UpdateProduct";
  String productStatusUpdate = "Products/UpdateStatus";
  String getImportProductFormat = "Products/GetImportFormat";
  String exportProduct = 'Products/ExportProduct';

  String denominationCreate = "Denomination/SaveDenomination";
  String denominationList = "Denomination/GetDenominations";
  String denominationUpdate = "Denomination/UpdateDenomination";

  String bulkProductCategorySort = "Categories/PriorityBulkImport";
  String cloudSettingsList = "cloudSettings/getCloudSettings";
  String cloudSettingsUpdate = "cloudSettings/updateCloudSettings";

  String getCountersAndDinominations = "Counters/GetCounterByStatus";
  String shiftCreate = "Shift/CreateShift";
  String shiftClose = "Shift/CloseCounter";

  String salesReport = "Report/GetSalesReport";
  String salesCancelReport = "Report/GetSalesCancelReport";

  String shiftReport = "Report/GetShiftReport";
  String purchaseReport = "/Inventory/GetPurchaseReport";
  String salesReturnReport = "Inventory/GetSalesReturnReport";
  String purchaseReturnReport = "Inventory/GetPurchaseReport";
  String getSalesInvoiceDetails = "Inventory/GetSalesInvoiceDetails";

  String counterCreate = 'Counters';
  String counterList = 'Counters/GetCounterByStatus';
  String counterEdit = 'Counters/UpdateCounter';
  String counterUpdateStatus = 'Counters/UpdateStatus';

  String loyaltyCreate = '/Loyalty/SaveLoyalty';
  String loyaltyGet = '/Loyalty/GetLoyalties';

  String customerCreate = 'Customer/SaveCustomer';
  String customerList = "Customer/GetCustomers";
  String customerEdit = 'Customer/UpdateCustomer';
  String customerStatusUpdate = 'Customer/UpdateStatus';

  String onlinePaymentCreate = 'OnlinePayment/SaveAccountMaster';
  String onlinePaymentGetAccountGroups = 'OnlinePayment/GetAccountGroups';
  String onlinePaymentGetAccountLedgers = "OnlinePayment/GetAccountLedgers";
  String onlinePaymentEdit = 'OnlinePayment/UpdateAccountMaster';
  String onlineUpdateAccountMasterStatus =
      'OnlinePayment/UpdateAccountMasterStatus';

  String paymentTypeCreate = 'OnlinePayment/SavePaymentType';
  String paymentTypeList = 'OnlinePayment/GetPaymentTypes';
  String paymentTypeEdit = 'OnlinePayment/UpdatePaymentType';

  String offerCreate = 'Offers/SaveOffers';
  String offerList = 'Offers/GetOffers';
  String offerEdit = 'Offers/UpdateOffers';

  String expenseCreate = 'Acounts/SaveVoucher';
  String expenseGetAccounts = 'Acounts/GetAccountIdsForExpenseVoucher';
  String expenseEdit = 'Acounts/UpdateVoucher';
  String expenseList = 'Acounts/GetVouchers';
  String generalExpenseCreate = 'Acounts/CreateExpenseShift';

  String getReceiptAllocationDetails = '/Acounts/GetReceiptAllocationDetails';
  String getPaymentAllocationDetails = '/Acounts/GetPaymentAllocationDetails';
  String saveAllocationData = '/Acounts/SaveAllocationData';
  String savePaymentAllocationData = '/Acounts/SavePaymentAllocationData';
  String getLedgerReport = '/Report/GetLedgerReport';
  String mergeOrder = '/SalesOrder/MergeSalesOrder';

  String supplierCreate = '/Supplier/SaveSupplier';
  String supplierList = "/Supplier/GetSuppliers";
  String supplierEdit = '/Supplier/UpdateSupplier';

  String purchaseCreate = '/Inventory/SavePurchase';
  String purchaseEdit = '/Inventory/UpdatePurchase';
  String purchaseList = '/Inventory/GetPurchaseDetails';

  String salesTypeCreate = '/SalesType/CreateSalesType';
  String salesTypeUpdate = 'SalesType/UpdateSalesType';
  String salesTypeList = '/SalesType/GetSalesType';
  String salesStatus = "SalesType/UpdateStatus";

  String stockLocationCreate = '/StockLocations/CreateStockLocations';
  String stockLocationUpdate = '/StockLocations/UpdateStockLocation';
  String stockLocationList = '/StockLocations/GetStoreLocations';

  String purchaseReturn = '/Inventory/SavePurchaseReturn';
  String purchaseReturnList = '/Inventory/GetPurchaseReturnDetails';
  String purchaseReturnEdit = '/Inventory/UpdatePurchaseReturn';

  String salesReturnCreate = '/Inventory/SaveSalesReturn';
  String salesReturnList = '/Inventory/GetSalesReturnDetails';
  String salesReturnEdit = '/Inventory/UpdateSalesReturn';
  String salesReportDetails = '/Report/GetSalesReportDetails';

  String saveStock = '/Inventory/SaveStockEntry';
  String stockEdit = '/Inventory/UpdateStockEntry';
  String stockList = '/Inventory/GetStockEntryDetails';

  String saveStockTransfer = '/Inventory/SaveStockTransfer';
  String stockTransferList = '/Inventory/GetStockTransferDetails';
  String stockTransferEdit = '/Inventory/UpdateStockTransfer';

  String saveKitchenRequest = '/Inventory/SaveKitchenRequest';
  String kitchenRequestEdit = '/Inventory/UpdateKitchenRequest';
  String kitchenRequestList = '/Inventory/GetKitchenRequest';
  String processKitchenRequest = '/Inventory/ProcessKitchenRequest';

  String getInvoiceDetails = '/Inventory/GetSalesInvoiceDetails';
  String getPurchaseDetails = '/Inventory/GetPurchaseDetails';
  String cashCustomerRegistration = "Customer/SaveCashCustomer";
  String rootCauseCreate = 'RootCause/CreateRootCause';
  String rootCauseList = 'RootCause/GetRouteCause';
  String rootCauseUpdate = 'RootCause/UpdateRootCause';
  String updateAddress = 'Customer/UpdateAddress';
  String rootCauseStatusUpdate = '';

  String cancelOrdersList = 'SalesOrder/GetOrderDetails';
  String cancelSalesOrder = 'SalesOrder/CancellSalesOrder';
  String updatePaymentSales = 'SalesOrder/UpdatePaymentSales';

  String splitOrder = 'SalesOrder/SplitSalesOrder';
  String loadDayClose = 'Shift/LoadCloseData';

  String floorsCreate = 'Tables/SaveFloor';
  String floorsList = 'Tables/GetFloors';
  String floorUpdate = 'Tables/UpdateFloor';
  String floorStatusUpdate = 'Tables/UpdateFloorStatus';

  String getPurchaseReturnReport = "Inventory/GetPurchaseReturnReport";
  String getTaxReport = "Acounts/GetTaxReport";
  String getStockSummary = "Report/GetStockSummaryReport";
  String getStockDeatils = "Report/GetStockDetailedReport";
  String getExpense = "Report/GetExpenseReport";
  String dayClose = "Shift/CloseDay";
  String outstandingPayabledetailes = "Acounts/GetOutstandingPayableDetails";
  String outstandingReceivabledetailes =
      "Acounts/GetOutstandingReceivableDetails";
  String taxUpdateStatus = "TaxScheme/UpdateStatus";
  String paymentTypeStatusUpadate = "OnlinePayment/UpdateStatus";
  String offerUpdateStatus = "Offers/UpdateStatus";
  String denominationstatus = "Denomination/UpdateStatus/";
  String routCauseStatus = "RootCause/UpdateStatus";
  String supplierStatus = "Supplier/UpdateStatus";

  String stockLocationStatus = "StockLocations/UpdateStatus";
  String getTables = "Tables/GetTables";
  String updateTableStatusFree = "Tables/UpdateTableStatus";
  String addUserFavorites = "Products/AddUserFavourites";

  String getEditCountOfOrder = "SalesOrder/GetEditCount";
  String forcefullLogout = 'Users/UpdateSessionCode';
  String kotStatusUpdate = 'SalesOrder/UpdateKotStatus';
}
