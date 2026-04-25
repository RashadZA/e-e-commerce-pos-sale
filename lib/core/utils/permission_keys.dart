part of 'design_utils.dart';

class PermissionKeys {
  PermissionKeys._(); // Prevent instantiation

  static const String superAdmin = "SUPER_ADMIN";
  static const String seeAuthPage = "SEE_AUTH_PAGE";
  static const String createOwnerAccount = "CREATE_OWNER_ACCOUNT";
  static const String createAdminAccount = "CREATE_ADMIN_ACCOUNT";
  static const String resetPassword = "RESET_PASSWORD";
  static const String changePassword = "CHANGE_PASSWORD";
  static const String login = "LOGIN";
  static const String logout = "LOGOUT";

  static const String seeUserList = "SEE_USER_LIST";
  static const String addNewUser = "ADD_NEW_USER";
  static const String editUser = "EDIT_USER";
  static const String deleteUser = "DELETE_USER";
  static const String assignRoleToUser = "ASSIGN_ROLE_TO_USER";
  static const String deactivateUser = "DEACTIVATE_USER";
  static const String seeUserDetails = "SEE_USER_DETAILS";

  static const String seeRoleList = "SEE_ROLE_LIST";
  static const String addNewRole = "ADD_NEW_ROLE";
  static const String editRole = "EDIT_ROLE";
  static const String deleteRole = "DELETE_ROLE";
  static const String assignPermissionsToRole = "ASSIGN_PERMISSIONS_TO_ROLE";

  static const String seeClinicList = "SEE_CLINIC_LIST";
  static const String addNewClinic = "ADD_NEW_CLINIC";
  static const String editClinic = "EDIT_CLINIC";
  static const String deleteClinic = "DELETE_CLINIC";
  static const String viewClinicDetails = "VIEW_CLINIC_DETAILS";

  static const String seeOperationList = "SEE_OPERATION_LIST";
  static const String addNewOperation = "ADD_NEW_OPERATION";
  static const String editOperation = "EDIT_OPERATION";
  static const String deleteOperation = "DELETE_OPERATION";
  static const String viewOperationDetails = "VIEW_OPERATION_DETAILS";

  static const String seeAllTestList = "SEE_ALL_TEST_LIST";
  static const String addNewAllTest = "ADD_NEW_ALL_TEST";
  static const String editAllTest = "EDIT_ALL_TEST";
  static const String deleteAllTest = "DELETE_ALL_TEST";
  static const String viewAllTestDetails = "VIEW_ALL_TEST_DETAILS";

  static const String seePatientList = "SEE_PATIENT_LIST";
  static const String addNewPatient = "ADD_NEW_PATIENT";
  static const String editPatient = "EDIT_PATIENT";
  static const String deletePatient = "DELETE_PATIENT";
  static const String viewPatientDetails = "VIEW_PATIENT_DETAILS";
  static const String viewPatientHistory = "VIEW_PATIENT_HISTORY";

  static const String seeDoctorList = "SEE_DOCTOR_LIST";
  static const String addNewDoctor = "ADD_NEW_DOCTOR";
  static const String editDoctor = "EDIT_DOCTOR";
  static const String deleteDoctor = "DELETE_DOCTOR";
  static const String viewDoctorProfile = "VIEW_DOCTOR_PROFILE";
  static const String assignDoctorToClinic = "ASSIGN_DOCTOR_TO_CLINIC";

  static const String seeAppointmentList = "SEE_APPOINTMENT_LIST";
  static const String createAppointment = "CREATE_APPOINTMENT";
  static const String updateAppointment = "UPDATE_APPOINTMENT";
  static const String cancelAppointment = "CANCEL_APPOINTMENT";
  static const String viewAppointmentDetails = "VIEW_APPOINTMENT_DETAILS";
  static const String checkInPatient = "CHECK_IN_PATIENT";
  static const String checkOutPatient = "CHECK_OUT_PATIENT";

  static const String createPrescription = "CREATE_PRESCRIPTION";
  static const String editPrescription = "EDIT_PRESCRIPTION";
  static const String deletePrescription = "DELETE_PRESCRIPTION";
  static const String viewPrescriptionList = "VIEW_PRESCRIPTION_LIST";
  static const String viewPrescriptionDetails = "VIEW_PRESCRIPTION_DETAILS";
  static const String createExistingPrescription = "CREATE_EXISTING_PRESCRIPTION";
  static const String editExistingPrescription = "EDIT_EXISTING_PRESCRIPTION";
  static const String deleteExistingPrescription = "DELETE_EXISTING_PRESCRIPTION";
  static const String viewExistingPrescriptionList = "VIEW_EXISTING_PRESCRIPTION_LIST";
  static const String viewExistingPrescriptionDetails = "VIEW_EXISTING_PRESCRIPTION_DETAILS";

  static const String seeTestList = "SEE_TEST_LIST";
  static const String addNewTest = "ADD_NEW_TEST";
  static const String editTest = "EDIT_TEST";
  static const String deleteTest = "DELETE_TEST";
  static const String assignTestToPatient = "ASSIGN_TEST_TO_PATIENT";
  static const String viewTestResults = "VIEW_TEST_RESULTS";
  static const String uploadTestResults = "UPLOAD_TEST_RESULTS";

  static const String seeOrderList = "SEE_ORDER_LIST";
  static const String createOrder = "CREATE_ORDER";
  static const String updateOrder = "UPDATE_ORDER";
  static const String cancelOrder = "CANCEL_ORDER";
  static const String printOrder = "PRINT_ORDER";
  static const String holdOrder = "HOLD_ORDER";
  static const String reprintOrder = "REPRINT_ORDER";
  static const String viewOrderDetails = "VIEW_ORDER_DETAILS";

  static const String seeMedicineList = "SEE_MEDICINE_LIST";
  static const String addNewMedicine = "ADD_NEW_MEDICINE";
  static const String editMedicine = "EDIT_MEDICINE";
  static const String deleteMedicine = "DELETE_MEDICINE";
  static const String stockIn = "STOCK_IN";
  static const String stockOut = "STOCK_OUT";
  static const String seeLowStockAlert = "SEE_LOW_STOCK_ALERT";

  static const String seeBillingList = "SEE_BILLING_LIST";
  static const String createBill = "CREATE_BILL";
  static const String updateBill = "UPDATE_BILL";
  static const String deleteBill = "DELETE_BILL";
  static const String printInvoice = "PRINT_INVOICE";
  static const String refundPayment = "REFUND_PAYMENT";
  static const String viewBillHistory = "VIEW_BILL_HISTORY";

  static const String seePaymentMethods = "SEE_PAYMENT_METHODS";
  static const String addPaymentMethod = "ADD_PAYMENT_METHOD";
  static const String editPaymentMethod = "EDIT_PAYMENT_METHOD";
  static const String deletePaymentMethod = "DELETE_PAYMENT_METHOD";

  static const String seeNotificationList = "SEE_NOTIFICATION_LIST";
  static const String sendNotification = "SEND_NOTIFICATION";
  static const String markNotificationAsRead = "MARK_NOTIFICATION_AS_READ";
  static const String deleteNotification = "DELETE_NOTIFICATION";

  static const String seeDailyReport = "SEE_DAILY_REPORT";
  static const String seeMonthlyReport = "SEE_MONTHLY_REPORT";
  static const String seePatientReport = "SEE_PATIENT_REPORT";
  static const String seeDoctorReport = "SEE_DOCTOR_REPORT";
  static const String seeFinancialReport = "SEE_FINANCIAL_REPORT";

  static const String seePosSalePage = "SEE_POS_SALE_PAGE";
  static const String addToCart = "ADD_TO_CART";
  static const String applyPosDiscount = "APPLY_POS_DISCOUNT";
  static const String holdBill = "HOLD_BILL";
  static const String reprintBill = "REPRINT_BILL";
  static const String quickBilling = "QUICK_BILLING";

  static const String viewGeneralSettings = "VIEW_GENERAL_SETTINGS";
  static const String editGeneralSettings = "EDIT_GENERAL_SETTINGS";
  static const String viewNotificationSettings = "VIEW_NOTIFICATION_SETTINGS";
  static const String editNotificationSettings = "EDIT_NOTIFICATION_SETTINGS";
  static const String viewPrinterSettings = "VIEW_PRINTER_SETTINGS";
  static const String editPrinterSettings = "EDIT_PRINTER_SETTINGS";

  static const String uploadFile = "UPLOAD_FILE";
  static const String deleteFile = "DELETE_FILE";
  static const String viewFileList = "VIEW_FILE_LIST";

  static const String seeDailySalesReport = "SEE_DAILY_SALES_REPORT";
  static const String seeMonthlySalesReport = "SEE_MONTHLY_SALES_REPORT";
  static const String seeInventoryReport = "SEE_INVENTORY_REPORT";
  static const String seeStaffReport = "SEE_STAFF_REPORT";

  static const String seeSubscriptionPlans = "SEE_SUBSCRIPTION_PLANS";
  static const String renewSubscription = "RENEW_SUBSCRIPTION";
  static const String cancelSubscription = "CANCEL_SUBSCRIPTION";
  static const String viewSubscriptionHistory = "VIEW_SUBSCRIPTION_HISTORY";

  static const String seeProductList = "SEE_PRODUCT_LIST";
  static const String addNewProduct = "ADD_NEW_PRODUCT";
  static const String editProduct = "EDIT_PRODUCT";
  static const String deleteProduct = "DELETE_PRODUCT";

  static const String seeSupplierList = "SEE_SUPPLIER_LIST";
  static const String addSupplier = "ADD_SUPPLIER";
  static const String editSupplier = "EDIT_SUPPLIER";
  static const String deleteSupplier = "DELETE_SUPPLIER";

  static const String viewAuditLogs = "VIEW_AUDIT_LOGS";
  static const String exportAuditLogs = "EXPORT_AUDIT_LOGS";

  static const String seeTestPage = "SEE_TEST_PAGE";

  static const String seeDeliveryList = "SEE_DELIVERY_LIST";
  static const String createDelivery = "CREATE_DELIVERY";
  static const String updateDelivery = "UPDATE_DELIVERY";
  static const String deleteDelivery = "DELETE_DELIVERY";
  static const String assignDeliveryStaff = "ASSIGN_DELIVERY_STAFF";
  static const String trackDelivery = "TRACK_DELIVERY";
  static const String completeDelivery = "COMPLETE_DELIVERY";
}

const List<String> allPermissionDataList = [
  "SUPER_ADMIN",
  "SEE_AUTH_PAGE",
  "CREATE_OWNER_ACCOUNT",
  "CREATE_ADMIN_ACCOUNT",
  "RESET_PASSWORD",
  "CHANGE_PASSWORD",
  "LOGIN",
  "LOGOUT",
  "SEE_USER_LIST",
  "ADD_NEW_USER",
  "EDIT_USER",
  "DELETE_USER",
  "ASSIGN_ROLE_TO_USER",
  "DEACTIVATE_USER",
  "SEE_USER_DETAILS",
  "SEE_ROLE_LIST",
  "ADD_NEW_ROLE",
  "EDIT_ROLE",
  "DELETE_ROLE",
  "ASSIGN_PERMISSIONS_TO_ROLE",
  "SEE_CLINIC_LIST",
  "ADD_NEW_CLINIC",
  "EDIT_CLINIC",
  "DELETE_CLINIC",
  "VIEW_CLINIC_DETAILS",
  "SEE_OPERATION_LIST",
  "ADD_NEW_OPERATION",
  "EDIT_OPERATION",
  "DELETE_OPERATION",
  "VIEW_OPERATION_DETAILS",
  "SEE_ALL_TEST_LIST",
  "ADD_NEW_ALL_TEST",
  "EDIT_ALL_TEST",
  "DELETE_ALL_TEST",
  "VIEW_ALL_TEST_DETAILS",
  "SEE_PATIENT_LIST",
  "ADD_NEW_PATIENT",
  "EDIT_PATIENT",
  "DELETE_PATIENT",
  "VIEW_PATIENT_DETAILS",
  "VIEW_PATIENT_HISTORY",
  "SEE_DOCTOR_LIST",
  "ADD_NEW_DOCTOR",
  "EDIT_DOCTOR",
  "DELETE_DOCTOR",
  "VIEW_DOCTOR_PROFILE",
  "ASSIGN_DOCTOR_TO_CLINIC",
  "SEE_APPOINTMENT_LIST",
  "CREATE_APPOINTMENT",
  "UPDATE_APPOINTMENT",
  "CANCEL_APPOINTMENT",
  "VIEW_APPOINTMENT_DETAILS",
  "CHECK_IN_PATIENT",
  "CHECK_OUT_PATIENT",
  "CREATE_PRESCRIPTION",
  "EDIT_PRESCRIPTION",
  "DELETE_PRESCRIPTION",
  "VIEW_PRESCRIPTION_LIST",
  "VIEW_PRESCRIPTION_DETAILS",
  "CREATE_EXISTING_PRESCRIPTION",
  "EDIT_EXISTING_PRESCRIPTION",
  "DELETE_EXISTING_PRESCRIPTION",
  "VIEW_EXISTING_PRESCRIPTION_LIST",
  "VIEW_EXISTING_PRESCRIPTION_DETAILS",
  "SEE_TEST_LIST",
  "ADD_NEW_TEST",
  "EDIT_TEST",
  "DELETE_TEST",
  "ASSIGN_TEST_TO_PATIENT",
  "VIEW_TEST_RESULTS",
  "UPLOAD_TEST_RESULTS",
  "SEE_ORDER_LIST",
  "CREATE_ORDER",
  "UPDATE_ORDER",
  "CANCEL_ORDER",
  "PRINT_ORDER",
  "HOLD_ORDER",
  "REPRINT_ORDER",
  "VIEW_ORDER_DETAILS",
  "SEE_MEDICINE_LIST",
  "ADD_NEW_MEDICINE",
  "EDIT_MEDICINE",
  "DELETE_MEDICINE",
  "STOCK_IN",
  "STOCK_OUT",
  "SEE_LOW_STOCK_ALERT",
  "SEE_BILLING_LIST",
  "CREATE_BILL",
  "UPDATE_BILL",
  "DELETE_BILL",
  "PRINT_INVOICE",
  "REFUND_PAYMENT",
  "VIEW_BILL_HISTORY",
  "SEE_PAYMENT_METHODS",
  "ADD_PAYMENT_METHOD",
  "EDIT_PAYMENT_METHOD",
  "DELETE_PAYMENT_METHOD",
  "SEE_NOTIFICATION_LIST",
  "SEND_NOTIFICATION",
  "MARK_NOTIFICATION_AS_READ",
  "DELETE_NOTIFICATION",
  "SEE_DAILY_REPORT",
  "SEE_MONTHLY_REPORT",
  "SEE_PATIENT_REPORT",
  "SEE_DOCTOR_REPORT",
  "SEE_FINANCIAL_REPORT",
  "SEE_POS_SALE_PAGE",
  "ADD_TO_CART",
  "APPLY_POS_DISCOUNT",
  "HOLD_BILL",
  "REPRINT_BILL",
  "QUICK_BILLING",
  "VIEW_GENERAL_SETTINGS",
  "EDIT_GENERAL_SETTINGS",
  "VIEW_NOTIFICATION_SETTINGS",
  "EDIT_NOTIFICATION_SETTINGS",
  "VIEW_PRINTER_SETTINGS",
  "EDIT_PRINTER_SETTINGS",
  "UPLOAD_FILE",
  "DELETE_FILE",
  "VIEW_FILE_LIST",
  "SEE_DAILY_SALES_REPORT",
  "SEE_MONTHLY_SALES_REPORT",
  "SEE_INVENTORY_REPORT",
  "SEE_STAFF_REPORT",
  "SEE_SUBSCRIPTION_PLANS",
  "RENEW_SUBSCRIPTION",
  "CANCEL_SUBSCRIPTION",
  "VIEW_SUBSCRIPTION_HISTORY",
  "SEE_PRODUCT_LIST",
  "ADD_NEW_PRODUCT",
  "EDIT_PRODUCT",
  "DELETE_PRODUCT",
  "SEE_SUPPLIER_LIST",
  "ADD_SUPPLIER",
  "EDIT_SUPPLIER",
  "DELETE_SUPPLIER",
  "VIEW_AUDIT_LOGS",
  "EXPORT_AUDIT_LOGS",
  "SEE_TEST_PAGE",
  "SEE_DELIVERY_LIST",
  "CREATE_DELIVERY",
  "UPDATE_DELIVERY",
  "DELETE_DELIVERY",
  "ASSIGN_DELIVERY_STAFF",
  "TRACK_DELIVERY",
  "COMPLETE_DELIVERY",
];

// Permission lists grouped by the first word (prefix) of each permission string.

const List<String> superPermissionsDataList = [
  "SUPER_ADMIN",
];

const List<String> seePermissionsDataList = [
  "SEE_ALL_TEST_LIST",
  "SEE_APPOINTMENT_LIST",
  "SEE_AUTH_PAGE",
  "SEE_BILLING_LIST",
  "SEE_CLINIC_LIST",
  "SEE_DAILY_REPORT",
  "SEE_DAILY_SALES_REPORT",
  "SEE_DELIVERY_LIST",
  "SEE_DOCTOR_LIST",
  "SEE_DOCTOR_REPORT",
  "SEE_FINANCIAL_REPORT",
  "SEE_INVENTORY_REPORT",
  "SEE_LOW_STOCK_ALERT",
  "SEE_MEDICINE_LIST",
  "SEE_MONTHLY_REPORT",
  "SEE_MONTHLY_SALES_REPORT",
  "SEE_NOTIFICATION_LIST",
  "SEE_OPERATION_LIST",
  "SEE_ORDER_LIST",
  "SEE_PATIENT_LIST",
  "SEE_PATIENT_REPORT",
  "SEE_PAYMENT_METHODS",
  "SEE_POS_SALE_PAGE",
  "SEE_PRODUCT_LIST",
  "SEE_ROLE_LIST",
  "SEE_STAFF_REPORT",
  "SEE_SUBSCRIPTION_PLANS",
  "SEE_SUPPLIER_LIST",
  "SEE_TEST_LIST",
  "SEE_TEST_PAGE",
  "SEE_USER_DETAILS",
  "SEE_USER_LIST",
];

const List<String> createPermissionsDataList = [
  "CREATE_ADMIN_ACCOUNT",
  "CREATE_APPOINTMENT",
  "CREATE_BILL",
  "CREATE_DELIVERY",
  "CREATE_EXISTING_PRESCRIPTION",
  "CREATE_ORDER",
  "CREATE_OWNER_ACCOUNT",
  "CREATE_PRESCRIPTION",
];

const List<String> resetPermissionsDataList = [
  "RESET_PASSWORD",
];

const List<String> changePermissionsDataList = [
  "CHANGE_PASSWORD",
];

const List<String> loginPermissionsDataList = [
  "LOGIN",
];

const List<String> logoutPermissionsDataList = [
  "LOGOUT",
];

const List<String> addPermissionsDataList = [
  "ADD_NEW_ALL_TEST",
  "ADD_NEW_CLINIC",
  "ADD_NEW_DOCTOR",
  "ADD_NEW_MEDICINE",
  "ADD_NEW_OPERATION",
  "ADD_NEW_PATIENT",
  "ADD_NEW_PRODUCT",
  "ADD_NEW_ROLE",
  "ADD_NEW_TEST",
  "ADD_NEW_USER",
  "ADD_PAYMENT_METHOD",
  "ADD_SUPPLIER",
  "ADD_TO_CART",
];

const List<String> editPermissionsDataList = [
  "EDIT_ALL_TEST",
  "EDIT_CLINIC",
  "EDIT_DOCTOR",
  "EDIT_EXISTING_PRESCRIPTION",
  "EDIT_GENERAL_SETTINGS",
  "EDIT_MEDICINE",
  "EDIT_NOTIFICATION_SETTINGS",
  "EDIT_OPERATION",
  "EDIT_PATIENT",
  "EDIT_PAYMENT_METHOD",
  "EDIT_PRESCRIPTION",
  "EDIT_PRINTER_SETTINGS",
  "EDIT_PRODUCT",
  "EDIT_ROLE",
  "EDIT_SUPPLIER",
  "EDIT_TEST",
  "EDIT_USER",
];

const List<String> deletePermissionsDataList = [
  "DELETE_ALL_TEST",
  "DELETE_BILL",
  "DELETE_CLINIC",
  "DELETE_DELIVERY",
  "DELETE_DOCTOR",
  "DELETE_EXISTING_PRESCRIPTION",
  "DELETE_FILE",
  "DELETE_MEDICINE",
  "DELETE_NOTIFICATION",
  "DELETE_OPERATION",
  "DELETE_PATIENT",
  "DELETE_PAYMENT_METHOD",
  "DELETE_PRESCRIPTION",
  "DELETE_PRODUCT",
  "DELETE_ROLE",
  "DELETE_SUPPLIER",
  "DELETE_TEST",
  "DELETE_USER",
];

const List<String> assignPermissionsDataList = [
  "ASSIGN_DELIVERY_STAFF",
  "ASSIGN_DOCTOR_TO_CLINIC",
  "ASSIGN_PERMISSIONS_TO_ROLE",
  "ASSIGN_ROLE_TO_USER",
  "ASSIGN_TEST_TO_PATIENT",
];

const List<String> deactivatePermissionsDataList = [
  "DEACTIVATE_USER",
];

const List<String> viewPermissionsDataList = [
  "VIEW_ALL_TEST_DETAILS",
  "VIEW_APPOINTMENT_DETAILS",
  "VIEW_AUDIT_LOGS",
  "VIEW_BILL_HISTORY",
  "VIEW_CLINIC_DETAILS",
  "VIEW_DOCTOR_PROFILE",
  "VIEW_EXISTING_PRESCRIPTION_DETAILS",
  "VIEW_EXISTING_PRESCRIPTION_LIST",
  "VIEW_FILE_LIST",
  "VIEW_GENERAL_SETTINGS",
  "VIEW_NOTIFICATION_SETTINGS",
  "VIEW_OPERATION_DETAILS",
  "VIEW_ORDER_DETAILS",
  "VIEW_PATIENT_DETAILS",
  "VIEW_PATIENT_HISTORY",
  "VIEW_PRESCRIPTION_DETAILS",
  "VIEW_PRESCRIPTION_LIST",
  "VIEW_PRINTER_SETTINGS",
  "VIEW_SUBSCRIPTION_HISTORY",
  "VIEW_TEST_RESULTS",
];

const List<String> updatePermissionsDataList = [
  "UPDATE_APPOINTMENT",
  "UPDATE_BILL",
  "UPDATE_DELIVERY",
  "UPDATE_ORDER",
];

const List<String> cancelPermissionsDataList = [
  "CANCEL_APPOINTMENT",
  "CANCEL_ORDER",
  "CANCEL_SUBSCRIPTION",
];

const List<String> checkPermissionsDataList = [
  "CHECK_IN_PATIENT",
  "CHECK_OUT_PATIENT",
];

const List<String> uploadPermissionsDataList = [
  "UPLOAD_FILE",
  "UPLOAD_TEST_RESULTS",
];

const List<String> printPermissionsDataList = [
  "PRINT_INVOICE",
  "PRINT_ORDER",
];

const List<String> holdPermissionsDataList = [
  "HOLD_BILL",
  "HOLD_ORDER",
];

const List<String> reprintPermissionsDataList = [
  "REPRINT_BILL",
  "REPRINT_ORDER",
];

const List<String> stockPermissionsDataList = [
  "STOCK_IN",
  "STOCK_OUT",
];

const List<String> refundPermissionsDataList = [
  "REFUND_PAYMENT",
];

const List<String> sendPermissionsDataList = [
  "SEND_NOTIFICATION",
];

const List<String> markPermissionsDataList = [
  "MARK_NOTIFICATION_AS_READ",
];

const List<String> applyPermissionsDataList = [
  "APPLY_POS_DISCOUNT",
];

const List<String> quickPermissionsDataList = [
  "QUICK_BILLING",
];

const List<String> renewPermissionsDataList = [
  "RENEW_SUBSCRIPTION",
];

const List<String> exportPermissionsDataList = [
  "EXPORT_AUDIT_LOGS",
];

const List<String> trackPermissionsDataList = [
  "TRACK_DELIVERY",
];

const List<String> completePermissionsDataList = [
  "COMPLETE_DELIVERY",
];



const String superAdminPermissionKey = "SUPER_ADMIN";
const String seeAuthPagePermissionKey = "SEE_AUTH_PAGE";
const String createOwnerAccountPermissionKey = "CREATE_OWNER_ACCOUNT";
const String createAdminAccountPermissionKey = "CREATE_ADMIN_ACCOUNT";
const String resetPasswordPermissionKey = "RESET_PASSWORD";
const String changePasswordPermissionKey = "CHANGE_PASSWORD";
const String loginPermissionKey = "LOGIN";
const String logoutPermissionKey = "LOGOUT";

const String seeUserListPermissionKey = "SEE_USER_LIST";
const String addNewUserPermissionKey = "ADD_NEW_USER";
const String editUserPermissionKey = "EDIT_USER";
const String deleteUserPermissionKey = "DELETE_USER";
const String assignRoleToUserPermissionKey = "ASSIGN_ROLE_TO_USER";
const String deactivateUserPermissionKey = "DEACTIVATE_USER";
const String seeUserDetailsPermissionKey = "SEE_USER_DETAILS";

const String seeRoleListPermissionKey = "SEE_ROLE_LIST";
const String addNewRolePermissionKey = "ADD_NEW_ROLE";
const String editRolePermissionKey = "EDIT_ROLE";
const String deleteRolePermissionKey = "DELETE_ROLE";
const String assignPermissionsToRolePermissionKey = "ASSIGN_PERMISSIONS_TO_ROLE";

const String seeClinicListPermissionKey = "SEE_CLINIC_LIST";
const String addNewClinicPermissionKey = "ADD_NEW_CLINIC";
const String editClinicPermissionKey = "EDIT_CLINIC";
const String deleteClinicPermissionKey = "DELETE_CLINIC";
const String viewClinicDetailsPermissionKey = "VIEW_CLINIC_DETAILS";

const String seeOperationListPermissionKey = "SEE_OPERATION_LIST";
const String addNewOperationPermissionKey = "ADD_NEW_OPERATION";
const String editOperationPermissionKey = "EDIT_OPERATION";
const String deleteOperationPermissionKey = "DELETE_OPERATION";
const String viewOperationDetailsPermissionKey = "VIEW_OPERATION_DETAILS";

const String seeAllTestListPermissionKey = "SEE_ALL_TEST_LIST";
const String addNewAllTestPermissionKey = "ADD_NEW_ALL_TEST";
const String editAllTestPermissionKey = "EDIT_ALL_TEST";
const String deleteAllTestPermissionKey = "DELETE_ALL_TEST";
const String viewAllTestDetailsPermissionKey = "VIEW_ALL_TEST_DETAILS";

const String seePatientListPermissionKey = "SEE_PATIENT_LIST";
const String addNewPatientPermissionKey = "ADD_NEW_PATIENT";
const String editPatientPermissionKey = "EDIT_PATIENT";
const String deletePatientPermissionKey = "DELETE_PATIENT";
const String viewPatientDetailsPermissionKey = "VIEW_PATIENT_DETAILS";
const String viewPatientHistoryPermissionKey = "VIEW_PATIENT_HISTORY";

const String seeDoctorListPermissionKey = "SEE_DOCTOR_LIST";
const String addNewDoctorPermissionKey = "ADD_NEW_DOCTOR";
const String editDoctorPermissionKey = "EDIT_DOCTOR";
const String deleteDoctorPermissionKey = "DELETE_DOCTOR";
const String viewDoctorProfilePermissionKey = "VIEW_DOCTOR_PROFILE";
const String assignDoctorToClinicPermissionKey = "ASSIGN_DOCTOR_TO_CLINIC";

const String seeAppointmentListPermissionKey = "SEE_APPOINTMENT_LIST";
const String createAppointmentPermissionKey = "CREATE_APPOINTMENT";
const String updateAppointmentPermissionKey = "UPDATE_APPOINTMENT";
const String cancelAppointmentPermissionKey = "CANCEL_APPOINTMENT";
const String viewAppointmentDetailsPermissionKey = "VIEW_APPOINTMENT_DETAILS";
const String checkInPatientPermissionKey = "CHECK_IN_PATIENT";
const String checkOutPatientPermissionKey = "CHECK_OUT_PATIENT";

const String createPrescriptionPermissionKey = "CREATE_PRESCRIPTION";
const String editPrescriptionPermissionKey = "EDIT_PRESCRIPTION";
const String deletePrescriptionPermissionKey = "DELETE_PRESCRIPTION";
const String viewPrescriptionListPermissionKey = "VIEW_PRESCRIPTION_LIST";
const String viewPrescriptionDetailsPermissionKey = "VIEW_PRESCRIPTION_DETAILS";
const String createExistingPrescriptionPermissionKey = "CREATE_EXISTING_PRESCRIPTION";
const String editExistingPrescriptionPermissionKey = "EDIT_EXISTING_PRESCRIPTION";
const String deleteExistingPrescriptionPermissionKey = "DELETE_EXISTING_PRESCRIPTION";
const String viewExistingPrescriptionListPermissionKey = "VIEW_EXISTING_PRESCRIPTION_LIST";
const String viewExistingPrescriptionDetailsPermissionKey = "VIEW_EXISTING_PRESCRIPTION_DETAILS";

const String seeTestListPermissionKey = "SEE_TEST_LIST";
const String addNewTestPermissionKey = "ADD_NEW_TEST";
const String editTestPermissionKey = "EDIT_TEST";
const String deleteTestPermissionKey = "DELETE_TEST";
const String assignTestToPatientPermissionKey = "ASSIGN_TEST_TO_PATIENT";
const String viewTestResultsPermissionKey = "VIEW_TEST_RESULTS";
const String uploadTestResultsPermissionKey = "UPLOAD_TEST_RESULTS";

const String seeOrderListPermissionKey = "SEE_ORDER_LIST";
const String createOrderPermissionKey = "CREATE_ORDER";
const String updateOrderPermissionKey = "UPDATE_ORDER";
const String cancelOrderPermissionKey = "CANCEL_ORDER";
const String printOrderPermissionKey = "PRINT_ORDER";
const String holdOrderPermissionKey = "HOLD_ORDER";
const String reprintOrderPermissionKey = "REPRINT_ORDER";
const String viewOrderDetailsPermissionKey = "VIEW_ORDER_DETAILS";

const String seeMedicineListPermissionKey = "SEE_MEDICINE_LIST";
const String addNewMedicinePermissionKey = "ADD_NEW_MEDICINE";
const String editMedicinePermissionKey = "EDIT_MEDICINE";
const String deleteMedicinePermissionKey = "DELETE_MEDICINE";
const String stockInPermissionKey = "STOCK_IN";
const String stockOutPermissionKey = "STOCK_OUT";
const String seeLowStockAlertPermissionKey = "SEE_LOW_STOCK_ALERT";

const String seeBillingListPermissionKey = "SEE_BILLING_LIST";
const String createBillPermissionKey = "CREATE_BILL";
const String updateBillPermissionKey = "UPDATE_BILL";
const String deleteBillPermissionKey = "DELETE_BILL";
const String printInvoicePermissionKey = "PRINT_INVOICE";
const String refundPaymentPermissionKey = "REFUND_PAYMENT";
const String viewBillHistoryPermissionKey = "VIEW_BILL_HISTORY";

const String seePaymentMethodsPermissionKey = "SEE_PAYMENT_METHODS";
const String addPaymentMethodPermissionKey = "ADD_PAYMENT_METHOD";
const String editPaymentMethodPermissionKey = "EDIT_PAYMENT_METHOD";
const String deletePaymentMethodPermissionKey = "DELETE_PAYMENT_METHOD";

const String seeNotificationListPermissionKey = "SEE_NOTIFICATION_LIST";
const String sendNotificationPermissionKey = "SEND_NOTIFICATION";
const String markNotificationAsReadPermissionKey = "MARK_NOTIFICATION_AS_READ";
const String deleteNotificationPermissionKey = "DELETE_NOTIFICATION";

const String seeDailyReportPermissionKey = "SEE_DAILY_REPORT";
const String seeMonthlyReportPermissionKey = "SEE_MONTHLY_REPORT";
const String seePatientReportPermissionKey = "SEE_PATIENT_REPORT";
const String seeDoctorReportPermissionKey = "SEE_DOCTOR_REPORT";
const String seeFinancialReportPermissionKey = "SEE_FINANCIAL_REPORT";

const String seePosSalePagePermissionKey = "SEE_POS_SALE_PAGE";
const String addToCartPermissionKey = "ADD_TO_CART";
const String applyPosDiscountPermissionKey = "APPLY_POS_DISCOUNT";
const String holdBillPermissionKey = "HOLD_BILL";
const String reprintBillPermissionKey = "REPRINT_BILL";
const String quickBillingPermissionKey = "QUICK_BILLING";

const String viewGeneralSettingsPermissionKey = "VIEW_GENERAL_SETTINGS";
const String editGeneralSettingsPermissionKey = "EDIT_GENERAL_SETTINGS";
const String viewNotificationSettingsPermissionKey = "VIEW_NOTIFICATION_SETTINGS";
const String editNotificationSettingsPermissionKey = "EDIT_NOTIFICATION_SETTINGS";
const String viewPrinterSettingsPermissionKey = "VIEW_PRINTER_SETTINGS";
const String editPrinterSettingsPermissionKey = "EDIT_PRINTER_SETTINGS";

const String uploadFilePermissionKey = "UPLOAD_FILE";
const String deleteFilePermissionKey = "DELETE_FILE";
const String viewFileListPermissionKey = "VIEW_FILE_LIST";

const String seeDailySalesReportPermissionKey = "SEE_DAILY_SALES_REPORT";
const String seeMonthlySalesReportPermissionKey = "SEE_MONTHLY_SALES_REPORT";
const String seeInventoryReportPermissionKey = "SEE_INVENTORY_REPORT";
const String seeStaffReportPermissionKey = "SEE_STAFF_REPORT";

const String seeSubscriptionPlansPermissionKey = "SEE_SUBSCRIPTION_PLANS";
const String renewSubscriptionPermissionKey = "RENEW_SUBSCRIPTION";
const String cancelSubscriptionPermissionKey = "CANCEL_SUBSCRIPTION";
const String viewSubscriptionHistoryPermissionKey = "VIEW_SUBSCRIPTION_HISTORY";

const String seeProductListPermissionKey = "SEE_PRODUCT_LIST";
const String addNewProductPermissionKey = "ADD_NEW_PRODUCT";
const String editProductPermissionKey = "EDIT_PRODUCT";
const String deleteProductPermissionKey = "DELETE_PRODUCT";

const String seeSupplierListPermissionKey = "SEE_SUPPLIER_LIST";
const String addSupplierPermissionKey = "ADD_SUPPLIER";
const String editSupplierPermissionKey = "EDIT_SUPPLIER";
const String deleteSupplierPermissionKey = "DELETE_SUPPLIER";

const String viewAuditLogsPermissionKey = "VIEW_AUDIT_LOGS";
const String exportAuditLogsPermissionKey = "EXPORT_AUDIT_LOGS";

const String seeTestPagePermissionKey = "SEE_TEST_PAGE";

const String seeDeliveryListPermissionKey = "SEE_DELIVERY_LIST";
const String createDeliveryPermissionKey = "CREATE_DELIVERY";
const String updateDeliveryPermissionKey = "UPDATE_DELIVERY";
const String deleteDeliveryPermissionKey = "DELETE_DELIVERY";
const String assignDeliveryStaffPermissionKey = "ASSIGN_DELIVERY_STAFF";
const String trackDeliveryPermissionKey = "TRACK_DELIVERY";
const String completeDeliveryPermissionKey = "COMPLETE_DELIVERY";