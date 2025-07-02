//
//  ViewControllerFactory.swift
//  JSZindigi
//
//  Created by Anis Ur Rehman on 12/06/2023.
//

import Foundation
import UIKit
import FittedSheets

protocol ViewControllerFactoryProtocol {
    init(apiClient: APIClientProtocol, authentication: AuthenticationProtocol, configurations: ConfigurationsProtocol, chatManager: ChatManagerProtocol, eventManager : EventManagerProtocol ,loginCompletion: @escaping (() -> Void), signupCompletion: @escaping (() -> Void), logoutCompletion: @escaping (() -> Void))
    // MARK: - Shortcut Handling
    func viewController(shortcutID: Int, navigationController: UINavigationController) -> UIViewController?
    func viewController(moreItemAction: String, splitBillEnabled: Bool, lmsProductID: String, navigationController: UINavigationController) -> UIViewController?
    
    // MARK: - Login Module
    func forgotPasswordViewController(service: DebitCardServiceProtocol?, pinType: PinType, mobileNumber: String, navigationController: UINavigationController) -> ForgotPasswordViewController
    func receivedOtpViewController(navigationController: UINavigationController, cnic:String, mobileNumber: String, otpVerified: @escaping ((String) -> Void)) -> ReceivedOtpViewController
    func newPinGenerateViewConrtroller(debitCard: DebitCardServiceProtocol?, pinType: PinType, navigationController: UINavigationController, cnic: String, mobileNumber: String, smsOtp: String, downTimeViewVisible: Bool, downTimeHeading: String, downtimeText: String) -> NewPinGenerateViewConrtroller
    func loginViewController(navigationController: UINavigationController, autoLogin: Bool) -> LoginViewController
    func loginOtpViewController(mobileNo: String, isBVSExempted: Bool, navigationController: UINavigationController, otpVerified: @escaping (() -> Void)) -> LoginOtpViewController
    func loginEmailOtpViewController(authentication: AuthenticationProtocol, otpVerified: @escaping(() -> Void)) -> LoginEmailOtpViewController
    
    // MARK: - Dashboard Module
    func dashboardViewController(updateCache: Bool, navigationController: UINavigationController) -> DashboardViewController
    func searchViewController(navigationController: UINavigationController) -> SearchViewController
    func notificationsViewController(navigationController: UINavigationController) -> NotificationsViewController
    func convertCurrencyViewController(navigationController: UINavigationController) -> ConvertCurrencyViewController
    func convertCurrencyReviewDetailsViewController(pkrAmount: String, usdAmount: String, conversionRate: String, fee: String, mobile: String, navigationController: UINavigationController) -> ConvertCurrencyReviewDetailsViewController
    func convertCurrencyProceedPaymentViewController(pkrAmount: String, usdAmount: String, conversionRate: String, fee: String, mobile: String, navigationController: UINavigationController) -> ConvertCurrencyProceedPaymentViewController
    func addShortcutsViewController(shortcuts: [Shortcut], selectionChanged: @escaping ((Shortcut) -> Void), navigationController: UINavigationController) -> AddShortcutsViewController
    func settingsViewController(navigationController: UINavigationController) -> SettingsViewController
    
    func biometricLoginViewController(navigationController: UINavigationController,mobileNo: String, authenticated: @escaping (() -> Void)) -> BiometricLoginViewController
    func biometricPinEntryViewController(navigationController: UINavigationController) -> BiometricPinEntryViewController
    func transferMoneyViewController(navigationController: UINavigationController) -> TransferMoneyViewController
    func onboardingViewController(navigationController: UINavigationController, loggedIn: @escaping (() -> Void)) -> OnboardingViewController
    
    //MARK: Signup
    func signupFormViewController(navigationController: UINavigationController) -> SignupFormViewController
    func signupCNICViewController(request: SignupRequest, navigationController: UINavigationController) -> SignupCNICViewController
    func signupOTPViewController(request: SignupRequest, navigationController: UINavigationController, otpVerified: @escaping ((Bool) -> Void)) -> SignupOTPViewController
    func signupPinViewController(request: SignupRequest, askSecurityQuestion: Bool, navigationController: UINavigationController) -> SignupPinViewController
    func signupQuestionViewController(questions: [SecurityQuestion], mobileNo: String, mpin: String, cnic: String, navigationController: UINavigationController) -> SignupQuestionViewController
    func signupSuccessViewController(navigationController: UINavigationController) -> SignupSuccessViewController
    func signupSuccessInvitationCodeViewController(referralCodeEnabled: Bool, errorMessage: String, codeLength: Int, navigationController: UINavigationController) -> SignupSuccessInvitationCodeViewController
    func minorWelcomeViewController(navigationController: UINavigationController) -> MinorWelcomeViewController
    func minorFormViewController(navigationController: UINavigationController) -> MinorFormViewController
    func minorOTPViewController(request: MinorRequest, navigationController: UINavigationController, otpVerified: @escaping (() -> Void)) -> MinorOTPViewController
    func minorCNICViewController(request: MinorRequest, navigationController: UINavigationController) -> MinorCNICViewController
    func minorParentOTPViewController(request: MinorRequest, navigationController: UINavigationController, otpVerified: @escaping (() -> Void)) -> MinorParentOTPViewController
    func minorPinViewController(request: MinorRequest, navigationController: UINavigationController) -> MinorPinViewController
    func minorSuccessViewController(navigationController: UINavigationController) -> MinorSuccessViewController
    func formBInfoViewController() -> GeneralPopupViewController
    func parentCnicInfoViewController() -> GeneralPopupViewController
    
    func hamburgerMenuViewController(navigationController: UINavigationController) -> HamburgerMenuViewController
    func hamburgerMenuSettingViewController(navigationController: UINavigationController) -> HamburgerMenuSettingViewController
    func hamburgerMenuAccountSettingChangePinViewController(navigationController: UINavigationController) -> HamburgerMenuAccountSettingChangePinViewController
    
    func gatesViewController(title: String?, gates: [GatesBody], placeholder: String) -> GatesViewController

    
    //MARK: Hamburger Menu Profile
    func hamburgerMenuProfileViewController(navigationController: UINavigationController) -> HamburgerMenuProfileViewController
    func hamburgerMenuTransactionLimitsViewController(navigationController: UINavigationController) -> HamburgerMenuTransactionLimitsViewController
    func hamburgerMenuFeedbackViewController(navigationController: UINavigationController) -> HamburgerMenuFeedbackViewController
    func hamburgerMenuProfilePictureViewController(navigationController: UINavigationController,imageUploaded: @escaping (() -> Void)) -> HamburgerMenuProfilePictureViewController
    func hamburgerMenuProfileUpdateNameViewController(navigationController: UINavigationController) -> HamburgerMenuProfileUpdateNameViewController
    func hamburgerMenuProfileUpdateEmailViewController(navigationController: UINavigationController, completion: @escaping (Bool) -> Void) -> HamburgerMenuProfileUpdateEmailViewController
    func hamburgerMenuUpdateAddressViewController(navigationController: UINavigationController) -> HamburgereMenuUpdateAddressViewController
    func hamburgerMenuUpdateNetworkViewController(navigationController: UINavigationController) -> HamburgerMenuUpdateNetworkViewController
    func hamburgerMenuUpdateCNICViewController(navigationController: UINavigationController) -> HamburgerMenuUpdateCNICViewController
    func hamburgerMenuProfileUpdateOtpViewController(navigationController: UINavigationController, newEmail: String) -> HamburgerMenuProfileUpdateEmailOtpViewController
    func hamburgerMenuLocateUsViewController(navigationController: UINavigationController, locationType: LocationType) -> HamburgerMenuLocateUsViewController
    func hamburgerMenuScheduleofChargesViewController(navigationController: UINavigationController) -> HamburgerMenuScheduleofChargesViewController
    func hamburgerMenuTalkToUsViewController(navigationController: UINavigationController) -> HamburgerMenuTalkToUsViewController
    func hamburgerMenuLocateUsBracnchesViewController(navigationController: UINavigationController) -> HamburgerMenuLocateUsBracnchesViewController
    func hamburgerMenuLocateUsAgentsViewController(navigationController: UINavigationController)->HamburgerMenuLocateUsAgentsViewController
    func hamburgerMenuLocateUsATMsViewController(navigationController: UINavigationController)->HamburgerMenuLocateUsATMsViewController
    func hamburgerMenuFAQSViewController(navigationController: UINavigationController) -> HamburgerMenuFAQSViewController
    func locateUsMapViewController(locationItemModel: LocationItem)-> LocateUsMapViewController
    func faqDetailViewController(navigationController: UINavigationController, faqQuestion: FAQModel) -> FaqDetailViewController
    func accountSmsAlertViewController(alertText: String, termsText: String, navigationController: UINavigationController) -> AccountSmsAlertViewController
    
    func moreMenuViewController(navigationController: UINavigationController) -> MoreMenuViewController
    
    //MARK: - Loans Module ViewControllers
    func loansMenuViewController(navigationController: UINavigationController) -> LoansMenuViewController
    func advanceSalaryMenuViewController(navigationController: UINavigationController) -> AdvanceSalaryMenuViewController
    func advanceSalaryLandingViewController(navigationController: UINavigationController) -> AdvanceSalaryLandingViewController
    func advanceCashOnBoardingViewController(navigationController: UINavigationController) -> AdvanceSalaryOnBoardingViewController
    func applyAdvanceSalaryViewController(navigationController: UINavigationController) -> ApplyAdvanceSalaryViewController
    func advanceCashHistoryViewController(navigationController: UINavigationController,  productId: String) -> AdvanceCashHistoryViewController
    func loansHistoryViewController(navigationController: UINavigationController) -> LoansHistoryViewController
    func loanDetailsViewController(loanDetails: LoanHistoryData, navigationController: UINavigationController) -> LoanDetailsViewController
    func selfRepaymentViewController(selfRepaymentData: SelfRepaymentModel, navigationController: UINavigationController) -> SelfRepaymentViewController
    func advanceCashLandingViewController(navigationController: UINavigationController) -> AdvanceCashLandingViewController
    func applyAdvanceCashViewController(optasiaInquiryBodyResponse: OptasiaInquiryBodyResponse ,navigationController: UINavigationController, productId: String) -> ApplyAdvanceCashViewController
    func loanPaymentPlanViewController(optasiaLoanPlanCalculation: OptasiaLoanPlanCalculationBodyResponse, navigationController: UINavigationController) -> LoanPaymentPlanViewController
    func advanceCashReceiptViewController(accountTitle: String, mobile: String, processingFee: String, amount: String, message: String, transactionId: String,  navigationController: UINavigationController, completion: @escaping (() -> Void)) -> AdvanceCashReceiptViewController
    func advanceCashReviewDetailsViewController(accountTitle: String, mobile: String, offerName: String, serviceFee: String, processingFee: String, amount: String, maturityDuration: String, dueDate: String, loanStartDate: String, loanEndDate: String, purposeOfLoan: String, navigationController: UINavigationController, productId: String, repaymentMethodId: String) -> AdvanceCashReviewDetailsViewController
    func cashRepaymentViewController(optasiaLoanOutstanding: OptasiaLoanOutstandingResponse, navigationController: UINavigationController, productId: String) -> CashRepaymentViewController
    func cashRepaymentReviewViewController(accountTitle: String, mobile: String, outStandingLoan: String, loanAmount: String, serviceFee: String, navigationController: UINavigationController, productId: String) -> CashRepaymentReviewViewController
    func cashRepaymentReceiptViewController(accountTitle: String, mobile: String, outStandingLoan: String, loanAmount: String, serviceFee: String, transactionId: String, navigationController: UINavigationController) -> CashRepaymentReceiptViewController
    func loanProductMenuViewController(lmsProductId: String, loanProductItems: LMSConfigBodyResponse, navigationController: UINavigationController, productID: Int,  navigationTitle : String) -> LoanProductMenuViewController
    func loanProductDurationViewController(lmsProductID: String, loanProductItems: LMSConfigBodyResponse, navigationController: UINavigationController , productId : Int, navigationTitle: String) -> LoanProductDurationViewController
    func repaymentPlanViewController(lmsInqueryDaya: InquiryLoanResponse, navigationController: UINavigationController) -> RepaymentPlanViewController
    func loanReviewDetailsViewController(navigationController: UINavigationController, receiptDataModel: ReceiptDataModel, loanInquery: InquiryLoanResponse) -> LoanReviewDetailsViewController
    func applyForLoanViewController(navigationController: UINavigationController , loanProductResponse: GetPoductDetailResponse,  selectedLoanProduct : LoanProductResponse, productId : Int, navigationTitle : String) -> ApplyForLoanViewController
    func loanReceiptViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt?, isHistory : Bool, isAdvanceSalary : Bool, isFromBikeFinancing: Bool, completion: @escaping (() -> Void)) -> LoanReceiptViewController
    //MARK: - Spin&Win Module ViewControllers
    func spinandwinOnboardingViewController(wheelItems: [WheelItemsResponse], termsAndConditions: [String], navigationController: UINavigationController) -> SpinAndWinOnboardingViewController
    func spinandwinHowitWorksViewController(wheelItems: [WheelItemsResponse], termsAndConditions: [String], navigationController: UINavigationController) -> SpinAndWinHowItWorksViewController
    func tryYourLuckViewController(wheelItems: [WheelItemsResponse], termsAndConditions: [String], navigationController: UINavigationController) -> TryYourLuckViewController
    func termsAndConditionsViewController(termsAndConditions: [String], navigationController: UINavigationController) -> TermsAndConditionsViewController
    func rewardAlertViewController(reward: String, text: String, image: String, hideSocialMedia: Bool, navigationController: UINavigationController) -> RewardAlertViewController
    func spinAndWinHistoryViewController(navigationController: UINavigationController) -> SpinAndWinHistoryViewController
    func zspinTabBarViewController(navigationController: UINavigationController) -> ZspinTabBarViewController
    
    //MARK: - Telco Module ViewControllers
    func telcoMenuViewController(navigationController: UINavigationController) -> TelcoMenuViewController
    func mobileLoadPostpaidContainerViewController(regularData: MobileLoadRegulars?, navigationController: UINavigationController) -> MobileLoadPostpaidContainerViewController
    func mobileLoadPrepaidContainerViewController(navigationController: UINavigationController) -> MobileLoadPrepaidContainerViewController
    func mobileLoadPostpaidViewController(regularData: MobileLoadRegulars?, navigationController: UINavigationController) -> MobileLoadPostpaidViewController
    func mobileLoadPrepaidViewController(navigationController: UINavigationController) -> MobileLoadPrepaidViewController
    func mobileLoadReviewDetailsViewController(recieverMobileNo: String, reciverName: String, companyId: Int, company: String, companyAction : String, productId: String, amount: String, fee: String, isPrepaid: Bool, navigationController: UINavigationController) -> MobileLoadReviewDetailsViewController
    func mobileLoadPaymentReceiptViewController(receieverMobileNo: String, receiverName: String, companyId: Int, company: String, amount: String, fee: String, transactionID : String, navigationController: UINavigationController, completion: @escaping (() -> Void)) -> MobileLoadPaymentReceiptViewController
    
    
    func mobileBundleListViewController(navigationController: UINavigationController) -> MobileBundleListViewController
    func recentMobileBundleListViewController(navigationController: UINavigationController) -> RecentMobileBundleListViewController
    func buyMobileBundleListViewController(companyId: String, companyLogoURL: String, bundle: BundleProduct, navigationController: UINavigationController) -> BuyMobileBundleViewController
    func mobileBundleReviewDetailsViewController(companyId: String, companyLogoURL: String, bundle: BundleProduct, receiverName: String, receiverNumber: String, navigationController: UINavigationController) -> MobileBundleReviewDetailsViewController
    func mobileBundlePaymentReceiptViewController(receieverMobileNo: String, receiverName: String, company: String, bundleName: String, amount: String, fee: String, transactionID: String, navigationController: UINavigationController, completion: @escaping (() -> Void)) -> MobileBundlePaymentReceiptViewController
    func mobileLoadRecentsViewController(navigationController: UINavigationController) -> MobileLoadRecentsViewController
    func editMobileLoadRecentViewController(navigationController: UINavigationController) -> EditMobileLoadRecentViewController
    func editMobileLoadRecentNameViewController(name: String, navigationController: UINavigationController) -> EditMobileLoadRecentNameViewController
    
    //MARK: - E-Sports
    func eSportsTournamentsViewController(navigationController: UINavigationController)->ESportsTournamentsViewController
    func newTournamentsViewController(navigationController: UINavigationController)->NewTournamentsViewController
    func myTournamentsViewController(navigationController: UINavigationController)->MyTournamentsViewController
    func playerRegistrationViewController(navigationController: UINavigationController, tournament: Tournament, tournamentConfiguration: TournamentConfiguration?)->PlayerRegistrationViewController
    func esportsRegistrationAlertViewController(navigationController: UINavigationController, registeredTournament: RegisteredTournament)->ESportsRegistrationAlertViewController
    func reviewPlayerViewController(navigationController: UINavigationController, tournamentId: Int, teamPlayers: [GamePlayer])->ReviewPlayerViewController
    
    //MARK: - E-Vouchers
    func eVouchersViewController(navigationController: UINavigationController)->EVouchersViewController
    func chooseVoucherViewController(navigationController: UINavigationController, sessionToken: String, selectedCompany: ProductAlteredLists)->ChooseVoucherViewController
    func howToUseVoucherViewController(navigationController: UINavigationController)->HowToUseVoucherViewController
    func evoucherReviewDetailsViewController(navigationController: UINavigationController,sessionToken: String, selectedCompany: ProductAlteredLists, selectedVoucher: ProductAlteredSubLists, email: String)->ReviewDetailsViewController
    func eVoucherPaymentReceiptViewController(navigationController: UINavigationController, purchasedVoucherResponse: VoucherDebitResponse, receiverName: String, voucherAmount: String)->EVoucherPaymentReceiptViewController
    func voucherSubListViewController(voucherSubList: [ProductAlteredSubLists]) -> VoucherSubListViewController
    //MARK: general
    func contactListViewController(navigationController: UINavigationController, isAllContact: Bool, titleText: String, onlyZindigiContacts: Bool, completion: @escaping ((ContactItem) -> Void)) -> ContactListViewController
    func cityViewController(title: String?, cities: [City], placeholder: String) -> CityViewController
    func countryViewController(title: String?, countries: [Country]) -> CountryViewController
    func datePickerViewController(selectedDate: Date, minimumDate: Date?, maximumDate: Date?, completion: @escaping (Date) -> Void) -> DatePickerViewController
    func webViewController(url: URL,showClose: Bool) -> WebViewController
    func otpViewController(navigationController: UINavigationController, type: OTPType, otplength: Int, otpVerified: @escaping ((Bool) -> Void)) -> OTPViewController
    //    func imagePickerViewController(captureMode: ImageCaptureMode, title: String, onBack: @escaping () -> Void, completion: @escaping () -> Void) -> ImageCaptureViewController
    
    //MARK: - BVS and Ultra
    func biometricVerificationViewController(navigationController: UINavigationController, isAccountLogin: Bool, isEmailVerification: Bool, isFromAccountUpgrade: Bool, completion: @escaping (Bool) -> Void) -> BiometricVerificationViewController
    func verifyBiometricViewController(navigationController: UINavigationController, isAccountLogin: Bool, isEmailVerification: Bool, isVerifyAccount: Bool, isJsUser: Bool, transactionID: String, isFromAccountUpgrade: Bool, jsUpgradeAccountRequest: JsUpgradeAccountRequestModel?, completion: @escaping (Bool) -> Void) -> VerifyBiometricViewController
    func bvsExemptionViewController(navigationController: UINavigationController, completion: ((Bool) -> Void)?) -> BVSExemptionViewController
    func ultraViewController(ultraInquiryResponse: [UltraAccountInquiryBody], ultraAccountStateModel: UltraSaveAccountStateModel?, navigationController: UINavigationController) -> UltraStartJourneyViewController
    func ultraBasicInfoViewController(acccountType: UltraAccountType, ultraAccountInquiryDetails: [UltraAccountInquiryDetails], ultraAccountStateModel: UltraSaveAccountStateModel?, accountLevel: String, navigationController: UINavigationController, pageTitle: String) -> UltraBasicInfoViewController
    func ultraEmailViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel?, navigationController: UINavigationController) -> UltraEmailViewController
    func ultraIdentityViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel?, navigationController: UINavigationController, resumePageNo: String, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraIdentityViewController
    func ultraDualCitizenViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel,  navigationController: UINavigationController, resumePageNo: String, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraDualCitizenViewController
    func personalIncomeViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel,  navigationController: UINavigationController, resumePageNo: String, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraPersonalIncomeViewController
    func ultraMailingAddressViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel, navigationController: UINavigationController, resumePageNo: String, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraMailingAddressViewController
    func ultraQuestionsViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel, navigationController: UINavigationController, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraQuestionsViewController
    func ultraDropdownViewController(dropdownList: [String], navigationController: UINavigationController) -> UltraDropdownViewController
    func ultraMobileViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel,  navigationController: UINavigationController, resumePageNo: String, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraMobileViewController
    func ultraVideoViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel?, navigationController: UINavigationController, resumePageNo: String, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraVideoViewController
    //MARK: - Transaction-History
    
    func transactionHistoryViewController(navigationController: UINavigationController, segmentType: String, initialIndex: Int, todayHistory: Bool) -> TransactionHistoryViewController
    
    // MARK: - QR Scan
    
    func becomeMerchantOnboardingViewController(model: MerchantOnboardingResponse, navigationController: UINavigationController) -> BecomeMerchantOnboardingViewController
    func becomeMerchantPersonalViewController(model: MerchantOnboardingResponse, navigationController: UINavigationController) -> BecomeMerchantPersonalViewController
    func becomeMerchantBusinessViewController(model: MerchantOnboardingResponse, personalInfo: MerchantPersonalInfo, navigationController: UINavigationController) -> BecomeMerchantBusinessViewController
    func merchantAttachmentInfoViewController() -> MerchantAttachmentInfoViewController
    func becomeMerchantSuccesViewController(model: BecomeMerchantSuccessModel, type: QRSuccessType, title: String, navigationController: UINavigationController) -> BecomeMerchantSuccesViewController
    func merchantDiscrepancyViewController(model: MerchantOnboardingResponse, navigationController: UINavigationController) -> MerchantDiscrepancyViewController
    
    func qrContainerViewController(navigationController: UINavigationController) -> QRContainerViewController
    func qrCustomerReqeustViewController(navigationController: UINavigationController) -> QRRequestsViewController
    func qrReceiveViewController(navigationController: UINavigationController) -> QRReceiveViewController
    
    func qrPayViewController(navigationController: UINavigationController) -> QRPayViewController
    func qrPayScanViewController(navigationController: UINavigationController, onScan: @escaping (DecodedQR) -> Void) -> QRPayScanViewController
    func qrPayFormViewController(decodedQR: DecodedQR, onTapEditAmount: (() -> Void)?, navigationController: UINavigationController) -> QRPayFormViewController
    func qrPayPreviewDetailsViewController(navigationController: UINavigationController, merchantDetails: [MerchantDetails]) -> QRPayPreviewDetailsViewController
    func qrPayReviewViewController(navigationController: UINavigationController, model: QRPayReviewModel, type: QRPayReviewType, isDynamicQR: Bool, onTapEditAmount: (() -> Void)?) -> QRPayReviewViewController
    func qrPayDetailsViewController(navigationController: UINavigationController, model: QRPayReviewModel, transactionDate: String, transactionTime: String, transactionId: String) -> QRPayDetailsViewController
    func qrTillPaymentViewController(navigationController: UINavigationController) -> QRTillPaymentViewController
    func qrMorePaymentsViewController(navigationController: UINavigationController) -> QRMorePaymentsViewController
    func qrMerchantRequestViewController(navigationController: UINavigationController) -> QRMerchantRequestViewController
    func qrMerchantNewPaymentRequestViewController(navigationController: UINavigationController) -> QRMNewPaymentRequestViewController
    func qrMerchantReceivedRequestsViewController(navigationController: UINavigationController) -> QRMReceivedRequestsViewController
    func qrMerchantManageInvoicesViewController(navigationController: UINavigationController) -> QRMManageInvoicesViewController
    
    func selectItemViewController(navigationController: UINavigationController, title: String, selectionData: [String], onSelect: @escaping (String) -> Void) -> SelectItemViewController
    
    
    // MARK: - MutualFunds
    
    func mFundsAccountRegistrationViewController(navigationController: UINavigationController) -> MFundsAccountRegistrationViewController
    func mFundsAccountVerificationViewController(cnic: String, cnicIssueDate: String, cnicExpiryDate: String, email: String, mobile: String, msgID: String, navigationController: UINavigationController) -> MFundsAccountVerificationViewController
    func mFundsAccountRegistrationStepThreeViewController(navigationController: UINavigationController, registrationData: MutualFundsRegistrationData) -> MFundsAccountRegistrationStepThreeViewController
    func mFundsAccountRegistrationStepFinalViewController(navigationController: UINavigationController, registrationData: MutualFundsRegistrationData, asanAccountCombos: LoadAsanAccountComboResponse?) -> MFundsAccountRegistrationStepFinalViewController
    
    func mFundsVerificationAlertViewController(navigationController: UINavigationController, completion: @escaping () -> Void) -> MFundsVerificationAlertViewController
    func fundsHomeViewController(mutualFundsResponse: (MFundsAccountDetailsResponse?, String), navigationController: UINavigationController) -> FundsHomeViewController
    func myFundsPortfoliaViewController(folioNumber: String, navigationController: UINavigationController) -> MyFundsPortfoliaViewController
    func myFundsViewController(navigationController: UINavigationController) -> MyFundsViewController
    func myFundsTransViewController(folioNumber: String, navigationController: UINavigationController) -> MyFundsTransViewController
    
    func fundsDetailsViewController(mutualFund: MutualFund?, investedFund: MyFund?, accountDetail: MFundsAccountDetailsResponse?, navigationController: UINavigationController) -> FundsDetailsViewController
    
    func investFundContainerViewController(navigationController: UINavigationController) -> InvestFundContainerViewController
    
    func cashOutFundViewController(fundName: String, unitPrice: String, fundCode: String, fundShortName: String, folioNumber: String, userId: String, bankAccount: String, salesLoad: String, balanceAmount: String, balanceUnits: String, navigationController: UINavigationController) -> CashOutFundViewController
    
    func cashOutFundReviewDetailsViewController(amount: String, fee: String, folioNumber: String, receiverName: String, fundName: String, fundCode: String, unitPrice: String, receiverMobile: String, saleLoad: String, userId: String, purchasedUnitDisplay : String, navigationController: UINavigationController) -> CashOutFundReviewDetailsViewController
    
    func cashOutFundReceiptViewController(amount: String, fee: String, receiverName: String, fundName: String, unitPrice: String, receiverMobile: String, purchasedUnitDisplay : String, navigationController: UINavigationController, completion: @escaping (() -> ())) -> CashOutFundReceiptViewController
    
    func upgradePersonalInfoViewController(navigationController: UINavigationController) -> UpgradePersonalInfoViewController
    func upgradeContactInfoViewController(navigationController: UINavigationController) -> UpgradeContactInfoViewController
    func upgradeNextOfKinInfoViewController(navigationController: UINavigationController) -> UpgradeNextOfKinInfoViewController
    func upgradeOtherInformationViewController(navigationController: UINavigationController) -> UpgradeOtherInfoViewController
    func upgradePowerOfAttorneyInfoViewController(navigationController: UINavigationController) -> UpgradePowerOfAttorneyInfoViewController
    func upgradeInvestmentInformationViewController(navigationController: UINavigationController) -> UpgradeInvestmentInfoViewController
    func investFundViewController(fundName: String, unitPrice: String, fundCode: String, fundShortName: String, folioNumber: String, userId: String, bankAccount: String, salesLoad: String, navigationController: UINavigationController) -> InvestFundViewController
    
    func investFundReviewDetailsViewController(amount: String, fee: String, receiverName: String, fundName: String, fundCode: String, unitPrice: String, senderName: String, accountNumber: String, folioNumber: String, userId: String, productId: String, saleLoad: String, navigationController: UINavigationController) -> InvestFundReviewDetailsViewController
    
    func convertFundViewController(navigationController: UINavigationController) -> ConvertFundViewController
    func selectFundViewController(navigationController: UINavigationController) -> SelectFundViewController
    func convertFundReviewDetailsViewController(navigationController: UINavigationController) -> ConvertFundReviewDetailsViewController
    func investFundReceiptViewController(amount: String, fee: String, receiverName: String, fundName: String, unitPrice: String, senderName: String, purchasedUnitDisplay : String, navigationController: UINavigationController, completion: @escaping (() -> ())) -> InvestFundReceiptViewController
    func convertFundReceiptViewController(navigationController: UINavigationController) -> ConvertFundReceiptViewController
    
    // MARK: - Invite And Earn
    func inviteAndEarnViewController(navigationController: UINavigationController) -> InviteAndEarnViewController
    func howItsWorkViewController(isDebitReferral: Bool) -> HowInviteEarnWorksViewController
    func inviteContactsViewController(isDebitReferral: Bool, navigationController: UINavigationController, title : String) -> InviteContactsViewController
    func inviteDetailsViewController(navigationController: UINavigationController, referralType: String) -> InviteDetailsViewController
    func betaInviteViewController(navigationController: UINavigationController) -> BetaInviteViewController
    func invitationCodeDetailsViewController(inviteCode: String, navigationController: UINavigationController) -> InvitationCodeDetailsViewController 
    
    //MARK: - TransferMoney
    func receivedGiftRequestViewConntroller(navigationController: UINavigationController,screenType: RequestGiftMoney,screenTitle: String, splitBillEnabled : Bool) -> ReceivedGiftViewController
    func internationalRemittenceDetailViewController(navigationController: UINavigationController, splitBillEnabled: Bool) -> InternationalRemittenceDetailViewController
    func ibftTransferReviewViewController(navigationController: UINavigationController,receiptDataModel: ReceiptDataModel, isJSBank: Bool,bankImage: String, splitBillEnabled : Bool) -> IBFTTransferReviewViewController
    func internationalRemittenceAddAmountViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> InternationalRemittenceAddAmountViewController
    func requestMoneyHistoryViewController(navigationController: UINavigationController, isGiftHistory: Bool, isSplitEquality : Bool) -> RequestMoneyHistoryViewController
    func receivedRequestMoneyHistoryViewController(navigationController: UINavigationController,isReceived:Bool, isGiftHistory: Bool, isSplitEquality: Bool) -> ReceivedRequestMoneyHistoryViewController
    func scheduleTransactionsHistoryViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> ScheduleTransactionsHistoryViewController
    func fromOtherBankViewController(navigationController: UINavigationController) -> FromOtherBankViewController
    func purposeOfPaymentViewConntroller(navigationController: UINavigationController, isFromZtoZIBFT: Bool, onSelectValue: ((String) -> Void)?) -> PurposeOfPaymentViewConntroller
    func selectRelationViewController(navigationController: UINavigationController) -> SelectRelationViewController
    func selectBankViewController(bankList: [AllBankListResponse], navigationController: UINavigationController) -> SelectBankViewController
    func transactionRecentViewController(navigationController: UINavigationController) -> TransactionRecentViewController
    func zTozTransferReviewDetailViewController(reviewData: WalletToWalletPaymentInqueryResponse,receiverNickName:String, splitBillEnabled: Bool, navigationController: UINavigationController, splitBillRecipientId : String, splitBillId : String, isSplitBillHistory: Bool) -> ZToZTransferReviewDetailViewController
    func cnicTransferReviewViewController(reviewData: WalletToCNICInquiryResponse, paymentOfPurpose:String, navigationController: UINavigationController, splitBillEnabled: Bool) -> CNICTransferReviewViewController
    func raastTransferSuccessfullViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt?,isHistoryReceipt : Bool, splitBillEnabled : Bool, completion: @escaping (() -> Void)) -> RaastTransferSuccessfullViewController
    func raastTransferReviewViewController(reviewData: ReceiptDataModel,receiverNickName:String, navigationController: UINavigationController, splitBillEnabled : Bool) -> RaastTransferReviewViewController
    func raastTransferDetailViewConntroller(navigationController: UINavigationController, recentItemModel: RecentItemResponse?, isRecent : Bool, splitBillEnabled : Bool) -> RaastTransferDetailViewConntroller
    func raastPaymentManagmentViewContoller(navigationController: UINavigationController, splitBillEnabled: Bool) -> TransferMoneyViewController
    func raastIDManagmentViewController(navigationController: UINavigationController) -> RaastIDManagmentViewController
    func raastLinkAccountViewController(navigationController: UINavigationController, isRegister: Bool) -> RaastLinkAccountViewController
    func selectDonationOrganizationViewController(allOrganization: [CharityItemResponse], navigationController: UINavigationController) -> SelectDonationOrganizationViewController
    func donationDetailViewController(navigationController: UINavigationController, splitBillEnabled: Bool) -> DonationDetailViewController
    func selectScheduleTranactionsViewController(navigationController: UINavigationController) -> SelectScheduleTranactionsViewController
    func scheduleTransactionsZindigiDetailViewController(navigationController: UINavigationController, splitBillEnabled: Bool) -> ScheduleTransactionsZindigiDetailViewController
    func recentsRequestMoneyViewController(navigationController: UINavigationController, recentScreenCase: RequestGiftMoney, splitBillEnabled : Bool) -> RecentsRequestMoneyViewController
    func scheduleTransactionsBankSuccessfulViewController(navigationController: UINavigationController, scheduleTransactionSuccessModel: ScheduleTransactionSuccessModel, splitBillEnabled: Bool) -> ScheduleTransactionsBankSuccessfulViewController
    func scheduleTransactionsZindigiReviewViewController(reviewData: ScheduleTransactionReviewModel, navigationController: UINavigationController, splitBillEnabled: Bool) -> ScheduleTransactionZindigiReviewViewController
    func scheduleTransactionsBankReviewViewController(reviewData: ScheduleTransactionReviewModel, navigationController: UINavigationController, isJSBank: Bool, splitBillEnabled: Bool) -> ScheduleTransactionsBankReviewViewController
    func scheduleTransactionsBankDetailViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> ScheduleTransactionsBankDetailViewController
    func scheduleTransactionsHistorySuccessfulViewController(navigationController: UINavigationController,transactionHistory: TransactionDataItemResponse, splitBillEnabled: Bool) -> ScheduleTransactionsHistorySuccessfulViewController
    func internationalRemittenceCnicViewController(navigationController: UINavigationController, request: InternationalRemmittenceRequest) -> InternationalRemittenceCnicViewController
    func internationalRemittenceIncomeViewController(navigationController: UINavigationController,request: InternationalRemmittenceRequest) -> InternationalRemittenceIncomeViewController
    func internationalRemittenceKinViewController(navigationController: UINavigationController,request: InternationalRemmittenceRequest) -> InternationalRemittenceKinViewController
    func internationalRemittenceOtherViewController(navigationController: UINavigationController,request: InternationalRemmittenceRequest) -> InternationalRemittenceOtherViewController
    func giftMoneyReviewViewController(reviewData: PaymentInquiryZindigiResponse, navigationController: UINavigationController,screenType: RequestGiftMoney, splitBillEnabled: Bool) -> GiftMoneyReviewViewController
    func requestForMoneyReviewViewController(reviewData: ReceivedRequestList, navigationController: UINavigationController,screenCase: RequestGiftMoney, splitBillEnabled : Bool) -> RequestForMoneyReviewViewController
    func changeRequestMoneyReviewViewController(reviewData: ReceivedRequestList, navigationController: UINavigationController,screenCase: RequestGiftMoney,changeAmount: String, splitBillEnabled: Bool) -> ChangeRequestMoneyReviewViewController
    func selectGiftViewController(navigationController: UINavigationController, giftMoneyItems: GiftMoneyItemsBody, splitBillEnabled: Bool) -> SelectGiftViewController
    func scheduleTransactionViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> ScheduleTransactionViewController
    func changeRequestMoneyDetailViewController(navigationController: UINavigationController,reviewData: ReceivedRequestList,screnCase: RequestGiftMoney, splitBillEnabled : Bool) -> ChangeRequestMoneyDetailViewController
    func selectFrequencyViewController(navigationController: UINavigationController) -> SelectFrequencyViewController
    func newGiftRequestViewContoller(navigationController: UINavigationController,screenType: RequestGiftMoney,title: String, splitBillEnabled: Bool) -> TransferMoneyViewController
    func selectRequestMoneyViewController(navigationController: UINavigationController, requestMoneyItems: GiftMoneyItemsBody, splitBillEnabled: Bool) -> SelectRequestMoneyViewController
    // MARK: -  Cards
    func selectDebitCardViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, hideIntroOrderCard: Bool) -> SelectDebitCardViewController
    func debitOrderCardDetailViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?,isFromReplaceCard: Bool?, selectedCard: CardVariant?) -> DebitOrderCardDetailViewController
    func debitOrderCardReviewViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, fullName: String?, completeAddress: String?, streetNumber: String?, houseNumber: String?, city: City?, area: City?, selectedHeroesCard: CardVariant?) -> DebitOrderCardReviewViewController
    func debitOrderCardSuccessfulViewConntroller(navigationController: UINavigationController, debitCardModel: DebitCardModel?, fullName: String?, completeAddress: String?) -> DebitOrderCardSuccessfulViewConntroller
    func cardControlViewController(navigationController: UINavigationController, debitCardConfiguration: DebitCardConfigurationResponse?) -> CardControlViewController
    func activeCardPinViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, onDebitCardActivation: @escaping (() -> Void)) -> ActiveCardPinViewController
    func trackDebitCardViewController(navigationController: UINavigationController) -> TrackDebitCardViewController
    func debitCardStatusViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, onDebitCardActivation: @escaping (() -> Void)) -> DebitCardStatusViewController
    func enterDebitCardNumberViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, onDebitCardActivation: @escaping (() -> Void) ) -> EnterDebitCardNumberViewController
    func debitCardOnBoardingIntroViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, tabbarController: TabBarController?) -> CardsOnBoardingViewController
    func changeCardPinViewController(navigationController: UINavigationController, pinType: PinType) -> ChangeCardPinViewController
    func activeDebitCardViewController(navigationController: UINavigationController) -> ActiveDebitCardViewController
    func myCardActiveViewContoller(isFromVirtualCard: Bool, navigationController: UINavigationController) -> CardSegmentViewController
    func myCardStatusViewContoller(isFromVirtualCard: Bool, navigationController: UINavigationController, debitCardModel: DebitCardModel?, tabbarController: TabBarController?, onDebitCardActivation: @escaping (() -> Void)) -> CardSegmentViewController
    
    //Virtual Card
    func virtualCardLandingViewController(navigationController: UINavigationController) -> VirtualCardLandingViewController
    func virtualCardControlsViewController(card: VirtualCard, navigationController: UINavigationController) -> VirtualCardControlsViewController
    func virtualCardCreatedViewController(cardDetails: VirtualCardBasicInformation, navigationController: UINavigationController) -> VirtualCardCreatedViewController
    func virtualCardCreatedeWithFeesViewController(cardDetails: VirtualCardBasicInformation, navigationController: UINavigationController) -> VirtualCardCreatedeWithFeesViewController 
    func VirtualCardReviewViewController(cardDetails: VirtualCardBasicInformation, navigationController: UINavigationController) -> VirtualCardReviewViewController
    
    //MARK: - Promotions
    func homePromotionsViewController(navigationController: UINavigationController) -> PromotionsHomeViewController
    func promotionDetailsViewController(promotionItem: Promotion, navigationController: UINavigationController) -> PromotionDetailsViewController
    //MARK: - EventsBanners
    func eventsBannerPopupViewController(navigationController: UINavigationController, popupBanner: PopupBanner) -> EventsBannerPopupViewController
    
    // MARK: -  Stocks
    func stocksOnboardingViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksOnboardingViewController
    //    func stocksHowItWorksViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksHowItWorksViewController
    func stocksViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksViewController
    func srPersonalInformationViewController(stockGenericLists: StockGenericListsResponse, navigationController: UINavigationController) -> SRPersonalInformationViewController
    func srSourceOfIncomeViewController(stockGenericLists: StockGenericListsResponse, request: StocksRegistrationRequest, navigationController: UINavigationController) -> SRSourceOfIncomeViewController
    func srDocumentsViewController(request: StocksRegistrationRequest, navigationController: UINavigationController) -> SRDocumentsViewController
    func stockDetailViewController(userAndMarketStatus: UserAndMarketDetails, stockDetail: MarketFeedDetailsResponse, isFromPortfolio: Bool, navigationController: UINavigationController) -> StockDetailViewController
    func stocksPortfolioViewController(userPortfolio: PortfolioDetailsResponse, marketStatus: String, userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksPortfolioViewController
    func stocksSearchViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksSearchViewController
    func stocksCashInCashOutViewController(cashIn: Bool, userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksCashInCashOutViewController
    func stocksCashInReviewViewController(request: CashInOutRequest, navigationController: UINavigationController) -> StocksCashInReviewViewController
    func stocksCashInSuccessViewController(receiptData: CashInOutReceipt, navigationController: UINavigationController) -> StocksCashInSuccessViewController
    func stocksCashOutReviewViewController(request: CashInOutRequest, navigationController: UINavigationController) -> StocksCashOutReviewViewController
    func stocksCashOutSuccessViewController(receiptData: CashInOutReceipt, navigationController: UINavigationController) -> StocksCashOutSuccessViewController
    func orderStockViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> OrderStockViewController
    func buySharesViewController(symbolCode: String, action: String, navigationController: UINavigationController) -> BuySharesViewController
    func buySellSharesReviewViewController(request: NewOrderRequest, navigationController: UINavigationController) -> BuySellSharesReviewViewController
    func buySellSharesSuccessViewController(request: NewOrderRequest, navigationController: UINavigationController) -> BuySellSharesSuccessViewController
    //MARK: - Campus Director Protocol
    func campusDirectorViewController(bannerURL: String, mobileNumber: String, cnic: String, navigationController: UINavigationController) -> CampusDirectorViewController
    func uploadDirectorDocumentsViewController(request: CampusDirectorRequest, navigationController: UINavigationController) -> UploadDirectorDocumentsViewController
    func directorApplicationSubmissionSuccessViewController(name: String) -> DirectorApplicationSubmissionViewController
    func imageSourceSheetViewController() -> ImageSourceSheetViewController
    //MARK: - Z Miles
    func zMilesOnboardingStep1ViewController(navigationController: UINavigationController) -> ZMilesOnBoardingViewController
    func zMilesDashboardViewController(navigationController: UINavigationController) -> ZMilesDashboardViewController
    func redeemMilesViewController(navigationController: UINavigationController, showMyVouchers: Bool) -> RedeemMilesViewController
    func buyVouchersViewController(navigationController: UINavigationController) -> BuyVouchersViewController
    func buyVouchersConfirmationViewController(navigationController: UINavigationController, voucher: ZmileVouchers) -> BuyVoucherConfirmationViewController
    func voucherRedepemtionSuccessViewController(navigationController: UINavigationController, miles: String, redemptionType: VoucherRedepemtionType) -> VoucherRedepemtionSuccessViewController
    func selectZmilesVoucherViewController(navigationController: UINavigationController, vouchers: [ZmileVouchers]) -> SelectZmilesVoucherViewController
    func subscribeToZmilesViewController(navigationController: UINavigationController) -> SubscribeToZmilesViewController
    func myVouchersViewController(navigationController: UINavigationController) -> MyVouchersViewController
    func zMilesBenefitsViewController(navigationController: UINavigationController) -> ZMilesBenefitsViewController
    func zMilesMoreInfoViewController(navigationController: UINavigationController, faqsList: [ZMilesFAQ], termsAndConditionsList: [ZMilesTermsAndCondition]) -> ZMilesMoreInfoViewController
    func milesCalculatorViewController(navigationController: UINavigationController) -> MilesCalculatorViewController
    
    // MARK: -  Main: General
    func selectDropdownOptionViewController(titleText: String?, placeholderText: String, dropDownData: [String]?, navigationController: UINavigationController) -> SelectDropdownOptionViewController
    //MARK: - Virtual Card
    func introDebitOrderCardViewController(cardDescriptions: [String], navigationController: UINavigationController, debitCardModel:DebitCardModel?) -> IntroDebitOrderCardViewController
    func introHeroesCardViewController(navigationController: UINavigationController, debitCardModel:DebitCardModel?) -> IntroHeroesCardViewController
    func debitCardTabViewContoller(navigationController: UINavigationController, tabbarController: TabBarController?) -> DebitCardTabViewController
    //MARK: - LoanProduct
    func loanProductBoardingViewController(navigationController: UINavigationController, onbaoardingResponse: LMSConfigBodyResponse, productID: Int, navigationTitle: String, lmsProductId: String) -> LoanProductBoardingViewController
    func loanProductHistoryViewController(lmsProductID: String, isFromBikeFinancing: Bool, navigationController: UINavigationController) -> LoanProductHistoryViewController
    func loanRepaymentViewController(lmsProductId: String, navigationController: UINavigationController) -> LoanRepaymentViewController
    func loanProductReviewDetailsViewController(lmsProductID: String, navigationController: UINavigationController , receiptDataModel: RePaymentInqueryResponse, loanID : String) -> LoanProductReviewDetailsViewController
    func loanProductTransferSuccessfullViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt?, isHistory : Bool, isFromBikeFinancing: Bool, completion: @escaping (() -> Void)) -> LoanProductTransferSuccessfullViewController
    func forceUpdateViewController() -> ForceUpdateViewController
    func jsUserVerifyOtpViewController(navigationController: UINavigationController) -> JSUserVerifyOtpViewController
    func jsBankCreatePinViewController(navigationController: UINavigationController, otpPin: String) -> JSBankCreatePinViewController
    func jsBankVerifyVideoViewController(navigationController: UINavigationController, isUpdate: Bool) -> JSBankVerifyVideoViewController
    func jsBankVerifyViewController(navigationController: UINavigationController, selfie: String, isUpdated: Bool) -> JSBankVerifyViewController
    // MARK: - Split Bill
    func splitBillOnBoardingViewController(navigationController: UINavigationController, onbaoardingResponse: SplitBillConfigBodyResponse, navigationTitle : String) -> SplitBillOnBoardingViewController
    func splitBillMenuViewController(splitBillItems : SplitBillConfigBodyResponse, navigationController: UINavigationController,   navigationTitle : String) -> SplitBillMenuViewController
    func splitBillHistoryViewController(navigationController: UINavigationController, segmentType: SplitBillSegmentType, initialIndex: Int) -> SplitBillHistoryViewController
    func splitBillDetailViewController(navigationController: UINavigationController, transactionAmount: String, isTransactionReceipt : Bool, splitItResponse : SplitBillItResponse?, isHistory : Bool) -> SplitBillDetailViewController
    func splitBillReviewViewController(isEqualSplit: Bool, navigationController: UINavigationController, splitDescription : String, splitCategoryId : Int, isTransactionReceipt : Bool, selectedContactList: [[String : Any]], totalAmount: String, isHistory : Bool) -> SplitBillReviewViewController
    func splitBillOptionViewController(dropDownData: [CategoriesSplitBill], navigationController: UINavigationController) -> SelectSplitBillCategoryViewController
    func splitBillContactListViewController(navigationController: UINavigationController, splitAmount : String, isEqualySplit: Bool, splitCategoryID : Int, splitDescription : String, isTransactionReceipt: Bool, isHistory : Bool) -> SplitBillContactListViewController
    
    // MARK: - EFU
    func onboardingEFUViewController(efuConfigurations: GetEFUConfigurationsResponse, navigationController: UINavigationController) -> OnboardingEFUViewController
    func insuranceHomeViewController(navigationController: UINavigationController) -> InsuranceHomeViewController
    func insurancePlanViewController(navigationController: UINavigationController) -> InsurancePlanViewController
    func efuSubscribedPlansViewController(navigationController: UINavigationController) -> EFUSubscribedPlansViewController
    func subscriptionPlanDetailsViewController(subscribedPlans: subscribedPlans, navigationController: UINavigationController) -> SubscriptionPlanDetailsViewController
    func zindigiPlanViewController(productId: Int, insurancePlanName: String, termsUrl: String, bannerImg: String, navigationController: UINavigationController) -> ZindigiPlanViewController
    func planDetailsViewController(subplanId: Int ,amount: String, planName: String, productId: Int , termsAndConditionsURL: String, beneficiaryMobile: String, navigationController: UINavigationController) -> PlanDetailsViewController
    func efuPlanReviewDetailsViewController(productId: Int, amount: String, insuranceType: String, planName: String, selectedPlanID: Int, email: String, relationshipWithBeneficiary: String, beneficiaryName: String, beneficiaryMobile: String, isUnderAge: Bool, guardianName: String, guardianRelationship: String, navigationController: UINavigationController) -> EFUPlanReviewDetailsViewController
    func subscribePlanViewController(productId: Int , amount: String, insuranceType: String, planName: String, selectedPlanID: Int, termsAndConditionsURL: String, beneficiaryMobile: String, navigationController: UINavigationController) -> SubscribePlanViewController
    func efuPlanSuccessReceiptViewController(receiptData: InsuranceReceipt, navigationController: UINavigationController) -> EFUPlanSuccessReceiptViewController
    func claimInsuranceViewController(insurancePlan: String, insurerName: String, productID: Int, amount: String, navigationController: UINavigationController) -> ClaimInsuranceViewController
    func filledClaimsViewController(navigationController: UINavigationController) -> FilledClaimsViewController
    func coverageDetailsViewController(title: String, details: [String], navigationController: UINavigationController) -> CoverageDetailsViewController
    func miniAppWebViewController(url: URL) -> MiniAppWebViewController
    
    //MARK: - Fuel Pocket
    func fuelPocketOnboardingViewController(petroPocketConfigResponse: PetroPocketConfigResponse, navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelPocketOnboardingViewController
    func fuelPocketDashboardViewController(petroPocketConfigResponse: PetroPocketConfigResponse, navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelPocketDashboardViewController
    func giftFuelViewController(isNumberEditable: Bool, petroPocketConfigResponse: PetroPocketConfigResponse, navigationController: UINavigationController, splitBillEnabled : Bool) -> GiftFuelViewController
    func fuelPocketTopUpViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelPocketTopUpViewController
    func giftFuelReviewViewController(giftFuelRequest: GiftFuelRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> GiftFuelReviewViewController
    func giftFuelSuccessViewController(giftFuelRequest: GiftFuelRequest, navigationController: UINavigationController, splitBillEnabled: Bool) -> GiftFuelSuccessViewController
    func fuelRatesViewController(petroPocketConfigResponse: PetroPocketConfigResponse, navigationController: UINavigationController) -> FuelRatesViewController
    func fuelTopUpReviewViewController(topUpAmount: String, topUpRequest: PetroTopUpRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelTopUpReviewViewController
    func fuelTopUpSuccessViewController(topUpAmount: String, topUpRequest: PetroTopUpRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelTopUpSuccessViewController
    func transferFuelReviewViewController(giftFuelRequest: GiftFuelRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> TransferFuelReviewViewController
    func transferFuelSuccessViewController(giftFuelRequest: GiftFuelRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> TransferFuelSuccessViewController
    func fuelPocketHistoryViewController(navigationController: UINavigationController) -> FuelPocketHistoryViewController
    
    //MARK: - Islamic Savings
    func islamicSavingsIntroViewController(navigationController: UINavigationController, islamicPlanResponse: IslamicSavingPlanResponse) -> IslamicSavingsIntroViewController
    func islamicSavingsAmountViewController(navigationController: UINavigationController, islamicPlanResponse: IslamicSavingPlanResponse, isFromInvestment: Bool) -> IslamicSavingsAmountViewController
    func islamicSavingsDashboardViewController(navigationController: UINavigationController, islamicPlanResponse: IslamicSavingPlanResponse) -> IslamicSavingsDashboardViewController
    func islamicSavingsReviewDetailsViewController(savingAmount: String, navigationController: UINavigationController, plainID: Int,  savingPlain: String, saving: String, isFromInvestment: Bool,  islamicSavingConfigurations: IslamicSavingConfiguration, fees: String) -> IslamicSavingsReviewDetailsViewController
    func islamicSavingsMoreViewController(navigationController: UINavigationController, faqs: [IslamicSavingFaq], bannerUrl: String) -> IslamicSavingsMoreViewController
    func islamicSavingsMoreDetailsViewController(navigationController: UINavigationController, faqQuestion: FAQModel) -> IslamicSavingsMoreDetailsViewController
    
    //MARK: - Account Certificates
    func certificatesLandingViewController(accountCertificatesData : AccountCertificateLandingResponse ,navigationController: UINavigationController) -> CertificatesLandingViewController
    
    func accountStatementViewController(certificateType  : String, heading : String,accountCertificatesData : AccountCertificateLandingResponse,navigationController: UINavigationController) -> AccountStatementViewController
    
    func taxCertificateViewController(certificateType  : String,heading : String,accountCertificatesData : AccountCertificateLandingResponse,navigationController: UINavigationController) -> TaxCertificateViewController
    
    func accountMaintenanceViewController(certificateType  : String,heading : String,accountCertificatesData : AccountCertificateLandingResponse,navigationController: UINavigationController) -> AccountMaintenanceViewController
    func userFeedbackViewController(lastActivity: String, navigationController: UINavigationController) -> UserFeedbackViewController
    func lowRatingPopupViewController() -> LowRatingPopupViewController

    
    //MARK: - Bike Financing
    func bikeFinancingMenuViewController(lmsProductID: String, navigationController: UINavigationController) -> BikeFinancingMenuViewController
    func bikeFinancingOnboardingViewController(lmsProductID: String, bikeFinancingConfigResponse: BikeFinancingConfigResponse, navigationController: UINavigationController) -> BikeFinancingOnboardingViewController
    func instalmentPlansViewController(lmsProductByIdResponse: GetLMSProductByIdResponse, bikeProductDetails: BikeModelDetails, navigationController: UINavigationController) -> InstalmentPlansViewController
    func bikeFinancingVerifyAccountViewController(selectedBikeDetails: BikeModelDetails, navigationController: UINavigationController) -> BikeFinancingVerifyAccountViewController
    func bikeFinancingLoansViewController(lmsProductId: String, navigationController: UINavigationController) -> BikeFinancingLoansViewController
    func bikeFinancingReviewViewController(lmsProductID: String, loanID: String?, bikeFinancingPaymentScenario: BikeFinancingPaymentScenario, selectedBikeDetails: BikeModelDetails?, rePaymentInqueryResponse: RePaymentInqueryResponse?, lmsLoanSettlementInfo: LmsLoanSettlementInfoResponse?, pendingLoanDetails: PendingLoanInstallmentDetailsPayLoadResponse?, navigationController: UINavigationController) -> BikeFinancingReviewViewController
    func bikeLoanRepaymentScheduleViewController(lmsProductID: String, navigationController: UINavigationController) -> BikeLoanRepaymentScheduleViewController
    func bikeFinancingCategoriesViewController(lmsProductID: String, navigationController: UINavigationController) -> BikeFinancingCategoriesViewController
    func bikeFinancingSuccessViewController(navigationController: UINavigationController, receiptModel: BikeFinancingSuccessReceipt?, isHistory: Bool, completion: @escaping (() -> Void)) -> BikeFinancingSuccessViewController
    func bikeFinancingFullPaymentSuccessViewController(navigationController: UINavigationController, receiptModel: BikeFinancingSuccessReceipt?, completion: @escaping (() -> Void)) -> BikeFinancingFullPaymentSuccessViewController
    func bikeFinancingInstallmentSuccessViewController(navigationController: UINavigationController, receiptModel: BikeFinancingSuccessReceipt?, completion: @escaping (() -> Void)) -> BikeFinancingInstallmentSuccessViewController

    //MARK: -Pay Via Link
    func payViaLinkSuccessfulViewController(navigationController: UINavigationController, receiptModel: TransferPaymentReceipt, generateLink : String) -> PayViaLinkSuccessfulViewController
    func payViaLinkReviewViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse, remark : String, payerEmail : String, usdAmount : String, payerName : String, inquiryResponse: InquiryPayViaLinkResponse?) -> PayViaLinkReviewViewController
    
    func payViaLinkCreateViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse?) -> PayViaLinkCreateViewController
    func payViaLinkRegistrationSuccessfulViewController(navigationController: UINavigationController, receiptModel: TransferPaymentReceipt, responseMessage : String, completion: @escaping (() -> Void)) -> PayViaLinkRegistrationSuccessfulViewController
    func payViaLinkRegistrationReviewViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse, address : String, freelancerUrl : String, inquiryResponse: InquiryPayViaLinkResponse?, city: String, province: String) -> PayViaLinkRegistrationReviewViewController
    
    func payViaLinkHomeViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse, navigationTitle : String) -> PayViaLinkHomeViewController
    
    func payLinkCancellationViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse, linkId : String) -> PayLinkCancellationViewController
    func payViaLinkHistoryViewController(navigationController: UINavigationController, segmentType: PayViaLinkSegmentType, initialIndex: Int, payLinkConfigData : PayViaLinkConfigBodyResponse) -> PayViaLinkHistoryViewController
    func payViaLinkOnBoardingViewController(navigationController: UINavigationController, onbaoardingResponse: PayViaLinkConfigResponse, navigationTitle : String) -> PayViaLinkOnBoardingViewController
    func payViaLinkBasicInfoViewController(navigationController: UINavigationController,  payLinkConfigData: PayViaLinkConfigBodyResponse?) -> PayViaLinkBasicInfoViewController
    func payViaLinkAddressViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse?) -> PayViaLinkAddressViewController
    //MARK: - ZSports
    func zSportsOnBoardingViewController(navigationController: UINavigationController, model: ZSportsGetConfigrationResponse) -> ZSportsOnBoardingViewController
    func zSportsStaterViewController(navigationController: UINavigationController, model: ZSportsGetConfigrationResponse) -> ZSportsStaterViewController
    func zSportsSelectCityViewController(navigationController: UINavigationController, locationType: LocationType) -> ZSportsSelectCityViewController
    func zSportsSelectSportViewController(navigationController: UINavigationController, complexListData: ComplexList, cityName: String) -> ZSportsSelectSportViewController
    func zSportsSlotSelectionViewController(navigationController: UINavigationController, sportCategory: AvailableSports, complexListData: ComplexList, sportId: String) -> ZSportsSlotSelectionViewController
    func zSportsReviewViewController(navigationController: UINavigationController, zSportsPaymentsInquiryData: ZSportsPaymentsInquiryResponse) -> ZSportsReviewViewController
    func zSportTransferSuccessfullViewController(navigationController: UINavigationController, zSportsPaymentsPayData: ZSportsPaymentsPayResponse, isHistoryReceipt: ZSportSuccess, zSportTransferSuccessfullQRItem: ZSportTransferSuccessfullQRItem, zSportTransferSuccessfullDetail: ZSportTransferSuccessfullDetail, completion: @escaping (() -> Void)) -> ZSportTransferSuccessfullViewController
    func zSportTransferQRSuccessfullViewController(navigationController: UINavigationController, isHistoryReceipt: ZSportSuccess, zSportTransferSuccessfullQRItem: ZSportTransferSuccessfullQRItem, zSportTransferSuccessfullDetail: ZSportTransferSuccessfullDetail, transactionId: String?, completion: @escaping (() -> Void)) -> ZSportTransferQRSuccessfullViewController
    func zSportHistoryViewController(navigationController: UINavigationController) -> ZSportHistoryViewController
    func zSportsFaqsViewController(navigationController: UINavigationController) -> ZSportsFaqsViewController
    func zSportsMapViewController(zSportsLocationItem: ZSportsLocationItem) -> ZSportsMapViewController
    
    func virtualCardSegmentView(navigationController: UINavigationController) -> TransferMoneyViewController
    
    
    //MARK: - Planckly
    func plancklyWebViewController(navigationController: UINavigationController) -> PlancklyWebViewController
    func plancklyReviewViewController(response: PlancklyResponse, navigationController: UINavigationController) -> PlancklyReviewViewController
    func plancklySuccessWebViewController(navigationController: UINavigationController) -> PlancklySuccessWebViewController
    
    //MARK: - ZTag
    func zTagOnBoardingViewController(navigationController: UINavigationController) -> ZTagOnBoardingViewController
    func zTagListViewController(navigationController: UINavigationController) -> ZTagListViewController
    func zTagHistoryViewController(navigationController: UINavigationController, zTagListItem: ZTagListItem) -> ZTagHistoryViewController
    func gTagHelpViewController(navigationController: UINavigationController,helpInfo: [HelpInfo]) -> GTagHelpViewController
    func gTagSheetViewController(vehicleImage: String, viewDetailImg: String, removeTagImg: String, removeTxt: String, viewDetailTxt: String, navigationController: UINavigationController) -> GTagSheetViewController
    //MARK: - Payment -> MTag M-Tag
    func mTagListViewController(category: PaymentMainCategory, payload: RecentPaymentPayload?, navigationController: UINavigationController) -> MTagListViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {

    private let eventManager : EventManagerProtocol
    private let apiClient: APIClientProtocol
    private let authentication: AuthenticationProtocol
    private let configurations: ConfigurationsProtocol
    private let chatManager: ChatManagerProtocol
    private let loginCompletion: (() -> Void)
    private let signupCompletion: (() -> Void)
    private let logoutCompletion: (() -> Void)
    required init(apiClient: APIClientProtocol, authentication: AuthenticationProtocol, configurations: ConfigurationsProtocol, chatManager: ChatManagerProtocol, eventManager : EventManagerProtocol ,loginCompletion: @escaping (() -> Void), signupCompletion: @escaping (() -> Void), logoutCompletion: @escaping (() -> Void)) {
        
        self.apiClient = apiClient
        self.authentication = authentication
        self.loginCompletion = loginCompletion
        self.signupCompletion = signupCompletion
        self.configurations = configurations
        self.logoutCompletion = logoutCompletion
        self.chatManager = chatManager
        self.eventManager = eventManager
    }
    
    // MARK: - Shortcut Handling
    func viewController(shortcutID: Int, navigationController: UINavigationController) -> UIViewController? {
        switch shortcutID {
        case ShortcutID.booking.rawValue:
            return ticketingWebViewViewController(navigationController: navigationController)
        case ShortcutID.transferMoney.rawValue:
            return transferMoneyViewController(navigationController: navigationController)
        case ShortcutID.payments.rawValue:
            return paymentViewContoller(navigationController: navigationController)
        case ShortcutID.mobileLoad.rawValue:
            return mobileLoadPostpaidContainerViewController(navigationController: navigationController)
        case ShortcutID.myLoans.rawValue:
            return loansMenuViewController(navigationController: navigationController)
        case ShortcutID.mutualFunds.rawValue:
            return nil
            
            //            return mFundsAccountVerificationViewController(navigationController: navigationController)
        case ShortcutID.mobileBundles.rawValue:
            return mobileBundleListViewController(navigationController: navigationController)
        case ShortcutID.advanceSalary.rawValue:
            return advanceSalaryMenuViewController(navigationController: navigationController)
            //        case ShortcutID.insurance.rawValue:
            //            return otherPaymentDetailViewController(category: , navigationController: navigationController)
        default:
            return nil
        }
    }
    func recentTransferController(recentItemAction: String, recentItemModel: RecentItemResponse, splitBillEnabled: Bool, navigationController: UINavigationController) -> UIViewController? {
        switch recentItemAction {
            
        case MoreItemAction.raast.rawValue, MoreItemAction.raastCapital.rawValue:
            return raastTransferDetailViewConntroller(navigationController: navigationController,recentItemModel: recentItemModel, isRecent: true, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.zindigi.rawValue:
            return zToZTransferDetailViewConntroller(navigationController: navigationController,recentItemModel: recentItemModel, isRecent: true, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.coreIbft.rawValue, MoreItemAction.ibft.rawValue:
            return ibftTransferDetailViewController(navigationController: navigationController,recentItemModel: recentItemModel, isRecent: true, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.cnic.rawValue:
            return cnicTransferDetailViewController(navigationController: navigationController,recentItemModel: recentItemModel, isRecent: true, splitBillEnabled: splitBillEnabled)
        default:
            return nil
        }
    }
    func viewController(moreItemAction: String, splitBillEnabled: Bool, lmsProductID: String, navigationController: UINavigationController) -> UIViewController? {
        switch moreItemAction {
        case MoreItemAction.moveMoney.rawValue:
            return transferMoneyViewController(navigationController: navigationController)
        case MoreItemAction.mutualFunds.rawValue:
            return nil
            // return mFundsAccountVerificationViewController(navigationController: navigationController)
            //        case MoreItemAction.insurance.rawValue:
            //            return otherPaymentDetailViewController(navigationController: navigationController)
        case MoreItemAction.mobileLoadAndBundles.rawValue:
            return telcoMenuViewController(navigationController: navigationController)
        case MoreItemAction.mobileLoad.rawValue:
            return mobileLoadPostpaidContainerViewController(navigationController: navigationController)
        case MoreItemAction.mobileBundles.rawValue:
            return mobileBundleListViewController(navigationController: navigationController)
        case MoreItemAction.scheduledTransactions.rawValue:
            return scheduleTransactionViewController(navigationController: navigationController, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.inviteAndEarn.rawValue:
            return inviteAndEarnViewController(navigationController: navigationController)
        case MoreItemAction.zindigi.rawValue:
            return zToZTransferDetailViewConntroller(navigationController: navigationController, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.bankTransfer.rawValue:
            return ibftTransferDetailViewController(navigationController: navigationController, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.cnicTransfer.rawValue:
            return cnicTransferDetailViewController(navigationController: navigationController, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.raast.rawValue:
            return raastPaymentManagmentViewContoller(navigationController: navigationController, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.donations.rawValue:
            return donationDetailViewController(navigationController: navigationController, splitBillEnabled: splitBillEnabled)
            //        case MoreItemAction.requestMoney.rawValue:
            //            return selectRequestMoneyViewController(navigationController: navigationController, requestMoneyItems: GiftMoneyItemsBody)
            //        case MoreItemAction.giftMoney.rawValue:
            //            return selectGiftViewController(navigationController: navigationController, GiftMoneyItems: GiftMoneyItemsBody)
        case MoreItemAction.scheduleTransaction.rawValue:
            return scheduleTransactionViewController(navigationController: navigationController, splitBillEnabled: splitBillEnabled)
        case MoreItemAction.FromOtherBank.rawValue:
            return fromOtherBankViewController(navigationController: navigationController)
        case MoreItemAction.payments.rawValue:
            return paymentViewContoller(navigationController: navigationController)
        case MoreItemAction.paymentsScreen.rawValue:
            return paymentViewContoller(navigationController: navigationController)
        case MoreItemAction.utilityBillPayment.rawValue:
            return paymentViewContoller(navigationController: navigationController)
        case MoreItemAction.eSports.rawValue:
            return eSportsTournamentsViewController(navigationController: navigationController)
        case MoreItemAction.evouchers.rawValue:
            return eVouchersViewController(navigationController: navigationController)
            //        case MoreItemAction.cardlessCash.rawValue:
            //            return cardlessOnboardingViewController(navigationController: navigationController)
        case MoreItemAction.advanceSalary.rawValue:
            return advanceSalaryMenuViewController(navigationController: navigationController)
        case MoreItemAction.transactionsLimits.rawValue:
            return hamburgerMenuTransactionLimitsViewController(navigationController: navigationController)
            //        case MoreItemAction.campusDirector.rawValue:
            //            return campusDirectorViewController(navigationController: navigationController)
            //        case MoreItemAction.ultra.rawValue:
            //            return ultraViewController(ultraInquiryResponse: [], ultraAccountStateModel: nil, navigationController: navigationController)
        case MoreItemAction.ticketing.rawValue:
            return ticketingWebViewViewController(navigationController: navigationController)
        case MoreItemAction.convertCurrency.rawValue:
            return convertCurrencyViewController(navigationController: navigationController)
            //        case MoreItemAction.fuelPocket.rawValue:
            //            return fuelPocketDashboardViewController(navigationController: navigationController)
            //        case MoreItemAction.islamicSavings.rawValue:
            //            return islamicSavingsIntroViewController(navigationController: navigationController, islamicPlanResponse: IslamicSavingPlanResponse)
        case MoreItemAction.ezBikes.rawValue:
            return bikeFinancingMenuViewController(lmsProductID: lmsProductID, navigationController: navigationController)
//        case MoreItemAction.plankly.rawValue:
//            return plancklyWebViewController(navigationController: navigationController)
        case MoreItemAction.planckly.rawValue:
            return plancklyWebViewController(navigationController: navigationController)
            
        default:
            return nil
        }
    }
    
    func comingSoonViewController(title: String = "") -> ComingSoonViewController {
        let viewController = Storyboard.general.instantiateViewController(identifier: ComingSoonViewController.storyboardIdentifier) as! ComingSoonViewController
        viewController.segmentTitle = title
        return viewController
    }
    
    // MARK: - Login Module
    func loginViewController(navigationController: UINavigationController, autoLogin: Bool) -> LoginViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: LoginViewController.storyboardIdentifier) as! LoginViewController
        viewController.viewModel = LoginViewModel(authentication, configurations: self.configurations, eventManager: self.eventManager, autoLogin: autoLogin)
        viewController.loggedIn = loginCompletion
        viewController.coordinator = LoginCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func loginOtpViewController(mobileNo: String, isBVSExempted: Bool, navigationController: UINavigationController, otpVerified: @escaping (() -> Void)) -> LoginOtpViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: LoginOtpViewController.storyboardIdentifier) as! LoginOtpViewController
        viewController.viewModel = LoginOtpViewModel(authentication: authentication, mobileNo: mobileNo, isBVSExempted: isBVSExempted)
        viewController.coordinator = LoginOtpCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.otpVerified = otpVerified
        
        return viewController
    }
    
    func loginEmailOtpViewController(authentication: AuthenticationProtocol, otpVerified: @escaping(() -> Void)) -> LoginEmailOtpViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: LoginEmailOtpViewController.storyboardIdentifier) as! LoginEmailOtpViewController
        viewController.viewModel = LoginEmailOtpViewModel(authentication: authentication)
    //    viewController.coordinator = ReceivedOtpCoordinnator(navigationController: navigationController, viewControllerFactory: self)
        viewController.otpVerified = otpVerified
        viewController.title = "Account Verification".localized
        
        return viewController
    }
    
    func receivedOtpViewController(navigationController: UINavigationController, cnic:String, mobileNumber: String, otpVerified: @escaping ((String) -> Void)) -> ReceivedOtpViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: ReceivedOtpViewController.storyboardIdentifier) as! ReceivedOtpViewController
        viewController.viewModel = ReceivedOtpViewModel(authentication: authentication, cnic: cnic, mobileNumber: mobileNumber)
        viewController.coordinator = ReceivedOtpCoordinnator(navigationController: navigationController, viewControllerFactory: self)
        viewController.otpVerified = otpVerified
        viewController.title = "Reset Pin".localized
        return viewController
    }
    func newPinGenerateViewConrtroller(debitCard: DebitCardServiceProtocol? = nil, pinType: PinType, navigationController: UINavigationController, cnic: String, mobileNumber: String, smsOtp: String, downTimeViewVisible: Bool = false, downTimeHeading: String = "", downtimeText: String = "") -> NewPinGenerateViewConrtroller {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: NewPinGenerateViewConrtroller.storyboardIdentifier) as! NewPinGenerateViewConrtroller
        viewController.viewModel = NewPinGenerateViewModel(debitCard: debitCard, pinType: pinType, authentication: authentication, cnic: cnic, mobileNumber: mobileNumber, otpPin: smsOtp, downTimeViewVisible: downTimeViewVisible, downTimeHeading: downTimeHeading, downtimeText: downtimeText)
        viewController.coordinator = NewPinGenerateCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func forgotPasswordViewController(service: DebitCardServiceProtocol? = nil, pinType: PinType = .loginPin, mobileNumber: String, navigationController: UINavigationController) -> ForgotPasswordViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: ForgotPasswordViewController.storyboardIdentifier) as! ForgotPasswordViewController
        viewController.viewModel = ForgotPasswordViewModel(service: service, pinType: pinType, authentication: authentication, mobileNumber: mobileNumber)
        viewController.coordinator = ForgotPasswordCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    // MARK: - Dashboard Module
    func dashboardViewController(updateCache: Bool, navigationController: UINavigationController) -> DashboardViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: DashboardViewController.storyboardIdentifier) as! DashboardViewController
        navigationController.pushViewController(viewController, animated: false)
        let storage = DashboardStorage()
        let service = DashboardService(apiClient: apiClient, storage: storage, updateCache: updateCache)
        let debitCardService = DebitCardService(apiClient: apiClient)
        let stocksService = StocksService(apiClient: apiClient)
        let zspinService = ZSpinService(apiClient: apiClient)
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        let paymentService = PaymentService(apiClient: apiClient)
        let ultraService = UltraService(apiClient: apiClient)
        let islamicSavingsService = IslamicSavingsService(apiClient: apiClient)
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        let efuService = EFUService(apiClient: apiClient)
        let loanProductService = LoanProductService(apiClient: apiClient)
        let campusDirectorService = CampusDirectorService(apiClient: apiClient)
        let advanceCashService = AdvanceCashService(apiClient: apiClient)
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        let splitBillService = SplitBillService(apiClient: apiClient)
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        viewController.viewModel = DashboardViewModel(service: service, debitCardService: debitCardService, stocksService: stocksService, configurations: configurations, user: authentication.user, authentication: authentication, card: authentication.card, chatManager: chatManager, zspinService: zspinService, mutualFundsService: mutualFundsService, dashboardStorage: storage, payment: payment, ultraService: ultraService, islamicservice: islamicSavingsService, transferMoneyService: transferMoneyService, efuService: efuService, loanProductService: loanProductService, campusDirectorService: campusDirectorService, advanceCashService: advanceCashService, splitBillService: splitBillService, fuelPocketService: fuelPocketService, bikeFinancingService: bikeFinancingService, eventManager: eventManager)
        viewController.coordinator = DashboardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func addShortcutsViewController(shortcuts: [Shortcut], selectionChanged: @escaping ((Shortcut) -> Void), navigationController: UINavigationController) -> AddShortcutsViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: AddShortcutsViewController.storyboardIdentifier) as! AddShortcutsViewController
        viewController.viewModel = AddShortcutsViewModel(shortcuts: shortcuts)
        viewController.coordinator = AddShortcutsCoordinator()
        viewController.selectionChanged = selectionChanged
        return viewController
    }
    
    func settingsViewController(navigationController: UINavigationController) -> SettingsViewController {
        let viewController = Storyboard.settings.instantiateViewController(identifier: SettingsViewController.storyboardIdentifier) as! SettingsViewController
        viewController.viewModel = SettingsViewModel()
        viewController.coordinator = SettingsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func mpinViewController(getMpinOnly: Bool = false, area: String, showBiometricPrompt: Bool = true, completion: @escaping ((SecurityPins) -> Void)) -> SheetViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: MpinViewController.storyboardIdentifier) as! MpinViewController
        viewController.viewModel = MpinViewModel(getMpinOnly: getMpinOnly, area: area, authentication: authentication, configurations: configurations, showBiometricPrompt: showBiometricPrompt)
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        viewController.onCompletion = { pins in
            sheetController.dismiss(animated: true) {
                completion(pins)
            }
        }
        viewController.onDismiss = {
            sheetController.dismiss(animated: true)
        }
        viewController.reloadView = {
            sheetController.updateIntrinsicHeight()
        }
        sheetController.treatPullBarAsClear = true
        sheetController.contentBackgroundColor = .clear
        sheetController.dismissOnOverlayTap = false
        return sheetController
    }
    
    func biometricLoginViewController(navigationController: UINavigationController, mobileNo: String, authenticated: @escaping (() -> Void)) -> BiometricLoginViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: BiometricLoginViewController.storyboardIdentifier) as! BiometricLoginViewController
        viewController.viewModel = BiometricLoginViewModel(authentication, configurations: configurations, eventManager: eventManager, mobileNumber: mobileNo)
        viewController.coordinator = BiometricLoginCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.authenticated = authenticated
        return viewController
    }
    
    func biometricPinEntryViewController(navigationController: UINavigationController) -> BiometricPinEntryViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: BiometricPinEntryViewController.storyboardIdentifier) as! BiometricPinEntryViewController
        viewController.viewModel = BiometricPinEntryViewModel()
        viewController.coordinator = BiometricPinEntryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func onboardingViewController(navigationController: UINavigationController, loggedIn: @escaping (() -> Void)) -> OnboardingViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: OnboardingViewController.storyboardIdentifier) as! OnboardingViewController
        viewController.viewModel = OnboardingViewModel(eventManager: self.eventManager)
        viewController.coordinator = OnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self) {
            loggedIn()
        }
        
        return viewController
    }
    
    func gatesViewController(title: String?, gates: [GatesBody], placeholder: String = "Select Gate".localized) -> GatesViewController {
        let viewController = Storyboard.virtualCard.instantiateViewController(identifier: GatesViewController.storyboardIdentifier) as! GatesViewController
        viewController.titleText = title
        viewController.gates = gates
        viewController.placeholderText = placeholder
        
        return viewController
    }
    
    func purposeOfPaymentViewConntroller(navigationController: UINavigationController, isFromZtoZIBFT: Bool = false, onSelectValue: ((String) -> Void)? = nil) -> PurposeOfPaymentViewConntroller {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: PurposeOfPaymentViewConntroller.storyboardIdentifier) as! PurposeOfPaymentViewConntroller
        viewController.isFromIBFTZtoZ = isFromZtoZIBFT
        viewController.onNext = onSelectValue
        return viewController
    }
    func selectRelationViewController(navigationController: UINavigationController) -> SelectRelationViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: SelectRelationViewController.storyboardIdentifier) as! SelectRelationViewController
        
        return viewController
    }
    
    
    func selectBankViewController(bankList: [AllBankListResponse], navigationController: UINavigationController) -> SelectBankViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: SelectBankViewController.storyboardIdentifier) as! SelectBankViewController
        viewController.allBankList = bankList
        
        return viewController
    }
    
    func selectDonationOrganizationViewController(allOrganization: [CharityItemResponse], navigationController: UINavigationController) -> SelectDonationOrganizationViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: SelectDonationOrganizationViewController.storyboardIdentifier) as! SelectDonationOrganizationViewController
        viewController.allCharityList = allOrganization
        
        return viewController
    }
    
    func transactionRecentViewController(navigationController: UINavigationController) -> TransactionRecentViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: TransactionRecentViewController.storyboardIdentifier) as! TransactionRecentViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = TransactionRecentViewModel(service: transferMoneyService, authentication: self.authentication)
        viewController.coordinator = TransactionRecentCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    // Z to IBFT
    func ibftTransferDetailViewController(navigationController: UINavigationController, recentItemModel: RecentItemResponse? = nil, isRecent : Bool = false,  splitBillEnabled: Bool) -> IBFTTransferDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: IBFTTransferDetailViewController.storyboardIdentifier) as! IBFTTransferDetailViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = IBFTTransferDetailViewModel(transferMoney: transferMoneyService, userMobileNumber: authentication.user.mobileNumber, email: authentication.user.email ?? "", name: authentication.account.nadraAccountTitle ?? "", userID: "\(self.authentication.user.userID ?? 0)", recentItemModel: recentItemModel, isRecent: isRecent, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = IBFTTransferDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func transferMoneyViewController(navigationController: UINavigationController) -> TransferMoneyViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: TransferMoneyViewController.storyboardIdentifier) as! TransferMoneyViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        
        viewController.viewModel = TransferMoneyViewModel(payment: payment, mobileNo: authentication.user.mobileNumber)
        viewController.coordinator = TransferMoneyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [categoryMenuViewController(navigationController: navigationController),
                                              transactionRecentViewController(navigationController: navigationController)]
        viewController.title = "Transfer Money".localized
        return viewController
    }
    
    func categoryMenuViewController(navigationController: UINavigationController) -> CategoryMenuViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: CategoryMenuViewController.storyboardIdentifier) as! CategoryMenuViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        let cardlessCashService = CardlessCashService(apiClient: apiClient)
        let splitBillService  = SplitBillService(apiClient: apiClient)
        let payViaLinkService = PayViaLinkService(apiClient: apiClient)
        viewController.viewModel = CategoryMenuViewModel(service: transferMoneyService, cardlessCashService: cardlessCashService, mobileNumber: authentication.user.mobileNumber, cnicNumber: authentication.user.cnic ?? "", accountType: authentication.account.accountType ?? "",splitBillService: splitBillService, payViaLinkService: payViaLinkService)
        viewController.coordinator = CategoryMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func menuViewController(navigationController: UINavigationController) -> MenuViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: MenuViewController.storyboardIdentifier) as! MenuViewController
        viewController.viewModel = MenuViewModel()
        viewController.coordinator = MenuCoordinator()
        viewController.title = "Mobile Load".localized
        return viewController
    }
    
    func ibftTransferReviewViewController(navigationController: UINavigationController,receiptDataModel: ReceiptDataModel, isJSBank: Bool,bankImage: String, splitBillEnabled : Bool) -> IBFTTransferReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: IBFTTransferReviewViewController.storyboardIdentifier) as! IBFTTransferReviewViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = IBFTTransferReviewViewModel(authentication: self.authentication, transferMoney: transferMoneyService, receiptDataModel: receiptDataModel, isJSBank: isJSBank,bankImage: bankImage, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = IBFTTransferReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func ibftTransferSuccessfullViewController(navigationController: UINavigationController, receiptModel: TransferPaymentReceipt?  = nil, splitBillEnabled: Bool, isOtherBank: Bool, completion: @escaping (() -> Void)) -> IBFTTransferSuccessfullViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: IBFTTransferSuccessfullViewController.storyboardIdentifier) as! IBFTTransferSuccessfullViewController
        viewController.viewModel = IBFTTransferSuccessfullViewModel(authentication: authentication, receiptModel:receiptModel, splitBillEnabled: splitBillEnabled, isOtherBank: isOtherBank)
        viewController.coordinator = IBFTTransferSuccessfullCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        
        return viewController
    }
    // Z To Z
    
    func changeRequestMoneyDetailViewController(navigationController: UINavigationController,reviewData: ReceivedRequestList,screnCase: RequestGiftMoney, splitBillEnabled : Bool) -> ChangeRequestMoneyDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ChangeRequestMoneyDetailViewController.storyboardIdentifier) as! ChangeRequestMoneyDetailViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = ChangeRequestMoneyDetailViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData,screenCase: screnCase, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ChangeRequestMoneyDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func giftMoneyDetailViewController(navigationController: UINavigationController,screenType: RequestGiftMoney, recentModel: GiftsRecentItemResponse? = nil,isRecent: Bool = false, splitBillEnabled : Bool) -> GiftMoneyDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: GiftMoneyDetailViewController.storyboardIdentifier) as! GiftMoneyDetailViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = GiftMoneyDetailViewModel(transferMoney: transferMoneyService, userMobileNumber: authentication.user.mobileNumber, email: authentication.user.email ?? "",screenType: screenType,recentModel: recentModel,isRecent: isRecent, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = GiftMoneyDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func changeRequestMoneyReviewViewController(reviewData: ReceivedRequestList, navigationController: UINavigationController,screenCase: RequestGiftMoney,changeAmount: String, splitBillEnabled: Bool) -> ChangeRequestMoneyReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ChangeRequestMoneyReviewViewController.storyboardIdentifier) as! ChangeRequestMoneyReviewViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = ChangeRequestMoneyReviewViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData, screenCase: screenCase,changeAmount : changeAmount, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ChangeRequestMoneyReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func requestForMoneyReviewViewController(reviewData: ReceivedRequestList, navigationController: UINavigationController,screenCase: RequestGiftMoney, splitBillEnabled : Bool) -> RequestForMoneyReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: RequestForMoneyReviewViewController.storyboardIdentifier) as! RequestForMoneyReviewViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = RequestForMoneyReviewViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData, screenCase: screenCase,splitBillEnabled: splitBillEnabled)
        viewController.coordinator = RequestForMoneyReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func giftMoneyReviewViewController(reviewData: PaymentInquiryZindigiResponse, navigationController: UINavigationController,screenType: RequestGiftMoney, splitBillEnabled: Bool) -> GiftMoneyReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: GiftMoneyReviewViewController.storyboardIdentifier) as! GiftMoneyReviewViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = GiftMoneyReviewViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData, screenType: screenType, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = GiftMoneyReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func giftMoneySuccessfulViewController(navigationController: UINavigationController,receiptModel:TransferPaymentReceipt? = nil,isHistoryReceipt : Bool = false, isSender : Bool = false, historySuccessFulCase: String = "", screenType: RequestGiftMoney = .gift, isRecivedGift : Bool = false, splitBillEnabled: Bool, completion: @escaping (() -> Void)) -> GiftMoneySuccessfulViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: GiftMoneySuccessfulViewController.storyboardIdentifier) as! GiftMoneySuccessfulViewController
        viewController.viewModel = GiftMoneySuccessfulViewModel(authentication: authentication,receiptModel: receiptModel,isHistoryReceipt: isHistoryReceipt, screenType: screenType, historySuccessFulCase: historySuccessFulCase, isSender: isSender, isRecivedGift: isRecivedGift, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = GiftMoneySuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        
        return viewController
    }
    func zToZTransferDetailViewConntroller(navigationController: UINavigationController, recentItemModel: RecentItemResponse? = nil, isRecent : Bool = false, splitBillEnabled: Bool, isSplitBillHistory : Bool = false, payReceiveSplitBillModel: PayReceiveSplitBill? = nil) -> ZToZTransferDetailViewConntroller {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ZToZTransferDetailViewConntroller.storyboardIdentifier) as! ZToZTransferDetailViewConntroller
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = ZToZTransferDetailViewModel(transferMoney: transferMoneyService, userMobileNumber: authentication.user.mobileNumber, email: authentication.user.email ?? "", recentItemModel: recentItemModel, isRecent: isRecent, splitBillEnabled: splitBillEnabled, isSplitBillHistory: isSplitBillHistory, payReceiveSplitBillModel: payReceiveSplitBillModel)
        viewController.coordinator = ZToZTransferDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func internationalRemittenceReviewViewController(reviewData: HRAInqueryResponse, navigationController: UINavigationController, splitBillEnabled: Bool) -> InternationalRemmitenceReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: InternationalRemmitenceReviewViewController.storyboardIdentifier) as! InternationalRemmitenceReviewViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = InternationalRemmitenceReviewViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = InternationalRemmitenceReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func donationReviewViewController(reviewData: ReceiptDataModel, navigationController: UINavigationController,  splitBillEnabled: Bool) -> DonationReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: DonationReviewViewController.storyboardIdentifier) as! DonationReviewViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = DonationReviewViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = DonationReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func zTozTransferReviewDetailViewController(reviewData: WalletToWalletPaymentInqueryResponse,receiverNickName:String, splitBillEnabled: Bool, navigationController: UINavigationController, splitBillRecipientId : String, splitBillId : String, isSplitBillHistory: Bool) -> ZToZTransferReviewDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ZToZTransferReviewDetailViewController.storyboardIdentifier) as! ZToZTransferReviewDetailViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = ZToZTransferReviewDetailViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData, splitBillEnabled: splitBillEnabled, splitBillRecipientId: splitBillRecipientId, splitBillId: splitBillId, isSplitBillHistory: isSplitBillHistory)
        viewController.coordinator = ZToZTransferReviewDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func transactionHistoryReceiptViewController(navigationController: UINavigationController, receiptModel: TransactionHistoryItem? = nil, showTransactionTitle: Bool = false) -> TransactionHistoryReceiptViewController {
        let viewController = Storyboard.transaction.instantiateViewController(identifier: TransactionHistoryReceiptViewController.storyboardIdentifier) as! TransactionHistoryReceiptViewController
        viewController.viewModel = TransactionHistoryReceiptViewModel(authentication: authentication, receiptModel: receiptModel, showTransactionTitle: showTransactionTitle)
        viewController.coordinator = TransactionHistoryReceiptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func zToZTransferSuccessfullViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt? = nil, splitBillEnabled: Bool, completion: @escaping (() -> Void)) -> ZToZTransferSuccessfullViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ZToZTransferSuccessfullViewController.storyboardIdentifier) as! ZToZTransferSuccessfullViewController
        viewController.viewModel = ZToZTransferSuccessfullViewModel(authentication: authentication, receiptModel: receiptModel, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ZToZTransferSuccessfullCoordinnator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        
        return viewController
    }
    func internationalRemmitenceSuccessfulViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt? = nil, splitBillEnabled: Bool, completion: @escaping (() -> Void)) -> InternationalRemmitenceSuccessfulViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: InternationalRemmitenceSuccessfulViewController.storyboardIdentifier) as! InternationalRemmitenceSuccessfulViewController
        viewController.viewModel = InternationalRemmitenceSuccessfulViewModel(authentication: authentication, receiptModel: receiptModel, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = InternationalRemmitenceSuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        
        return viewController
    }
    // Z to CNIC
    func cnicTransferDetailViewController(navigationController: UINavigationController, recentItemModel: RecentItemResponse? = nil, isRecent : Bool = false , splitBillEnabled: Bool) -> CNICTransferDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: CNICTransferDetailViewController.storyboardIdentifier) as! CNICTransferDetailViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = CNICTransferDetailViewModel(transferMoney: transferMoneyService, userMobileNumber: authentication.user.mobileNumber, email: authentication.user.email ?? "", recentItemModel: recentItemModel, isRecent: isRecent, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = CNICTransferDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        let formattedText = "\u{200E} ٹرانسفر CNIC"
        viewController.title = Language.current == .english ? "CNIC Transfer" : formattedText
        return viewController
    }
    func cnicTransferReviewViewController(reviewData: WalletToCNICInquiryResponse, paymentOfPurpose:String, navigationController: UINavigationController, splitBillEnabled: Bool) -> CNICTransferReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: CNICTransferReviewViewController.storyboardIdentifier) as! CNICTransferReviewViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = CNICTransferReviewViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData, paymentOfPurpose: paymentOfPurpose, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = CNICTransferReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func cnicTransferSuccessfullViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt? = nil, splitBillEnabled: Bool, completion: @escaping (() -> Void)) -> CNICTransferSuccessfullViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: CNICTransferSuccessfullViewController.storyboardIdentifier) as! CNICTransferSuccessfullViewController
        viewController.viewModel = CNICTransferSuccessfullViewModel(authentication: self.authentication,receiptModel: receiptModel, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = CNICTransferSuccessfullCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    // Z to Raast
    func raastTransferDetailViewConntroller(navigationController: UINavigationController, recentItemModel: RecentItemResponse? = nil, isRecent : Bool = false, splitBillEnabled : Bool) -> RaastTransferDetailViewConntroller {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: RaastTransferDetailViewConntroller.storyboardIdentifier) as! RaastTransferDetailViewConntroller
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = RaastTransferDetailViewModel(transferMoney: transferMoneyService, userMobileNumber: self.authentication.user.mobileNumber, email: self.authentication.user.email ?? "",  recentItemModel: recentItemModel, isRecent: isRecent, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = RaastTransferDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func raastTransferReviewViewController(reviewData: ReceiptDataModel,receiverNickName:String, navigationController: UINavigationController, splitBillEnabled : Bool) -> RaastTransferReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: RaastTransferReviewViewController.storyboardIdentifier) as! RaastTransferReviewViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = RaastTransferReviewViewModel(authentication: self.authentication, transferMoney: transferMoneyService, reviewData: reviewData, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = RaastTransferReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func raastTransferSuccessfullViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt? = nil,isHistoryReceipt : Bool = true, splitBillEnabled : Bool, completion: @escaping (() -> Void)) -> RaastTransferSuccessfullViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: RaastTransferSuccessfullViewController.storyboardIdentifier) as! RaastTransferSuccessfullViewController
        viewController.viewModel = RaastTransferSuccessfullViewModel(authentication: authentication, receiptModel: receiptModel,isHistoryReceipt: isHistoryReceipt, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = RaastTransferSuccessfullCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        
        return viewController
    }
    func raastPaymentManagmentViewContoller(navigationController: UINavigationController, splitBillEnabled: Bool) -> TransferMoneyViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: TransferMoneyViewController.storyboardIdentifier) as! TransferMoneyViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        
        viewController.viewModel = TransferMoneyViewModel(payment: payment, mobileNo: authentication.user.mobileNumber)
        viewController.coordinator = TransferMoneyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [
            raastTransferDetailViewConntroller(navigationController: navigationController, splitBillEnabled: splitBillEnabled),
            //qrMorePaymentsViewController(navigationController: navigationController),
            raastIDManagmentViewController(navigationController: navigationController)
            //  comingSoonViewController(title: "ID Managment")
        ]
        viewController.title = "Raast".localized
        return viewController
    }
    func raastIDManagmentViewController(navigationController: UINavigationController) -> RaastIDManagmentViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: RaastIDManagmentViewController.storyboardIdentifier) as! RaastIDManagmentViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = RaastIDManagmentViewModel(service: transferMoneyService, authentication: self.authentication)
        viewController.coordinator = RaastIDManagmentCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func raastLinkAccountViewController(navigationController: UINavigationController, isRegister: Bool) -> RaastLinkAccountViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: RaastLinkAccountViewController.storyboardIdentifier) as! RaastLinkAccountViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = RaastLinkAccountViewModel(service: transferMoneyService, authentication: self.authentication, isRegister: isRegister)
        viewController.coordinator = RaastLinkAccountCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    //MARK: Signup
    func signupFormViewController(navigationController: UINavigationController) -> SignupFormViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: SignupFormViewController.storyboardIdentifier) as! SignupFormViewController
        viewController.viewModel = SignupFormViewModel(eventManager: self.eventManager)
        viewController.coordinator = SignupFormCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func signupCNICViewController(request: SignupRequest, navigationController: UINavigationController) -> SignupCNICViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: SignupCNICViewController.storyboardIdentifier) as! SignupCNICViewController
        viewController.viewModel = SignupCNICViewModel(authentication: authentication, request: request, eventManager: self.eventManager)
        viewController.coordinator = SignupCNICCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func signupOTPViewController(request: SignupRequest, navigationController: UINavigationController, otpVerified: @escaping ((Bool) -> Void)) -> SignupOTPViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: SignupOTPViewController.storyboardIdentifier) as! SignupOTPViewController
        viewController.viewModel = SignupOTPViewModel(authentication: authentication, request: request, eventManager: self.eventManager)
        viewController.coordinator = SignupOTPCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.otpVerified = otpVerified
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func signupPinViewController(request: SignupRequest, askSecurityQuestion: Bool, navigationController: UINavigationController) -> SignupPinViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: SignupPinViewController.storyboardIdentifier) as! SignupPinViewController
        viewController.viewModel = SignupPinViewModel(authentication: authentication, request: request, askSecurityQuestion: askSecurityQuestion, eventManager: self.eventManager)
        viewController.coordinator = SignupPinCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func signupQuestionViewController(questions: [SecurityQuestion], mobileNo: String, mpin: String, cnic: String, navigationController: UINavigationController) -> SignupQuestionViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: SignupQuestionViewController.storyboardIdentifier) as! SignupQuestionViewController
        viewController.viewModel = SignupQuestionViewModel(authentication: authentication, eventManager: self.eventManager, questions: questions, mobileNo: mobileNo, mpin: mpin, cnic: cnic)
        viewController.coordinator = SignupQuestionCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func signupSuccessViewController(navigationController: UINavigationController) -> SignupSuccessViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: SignupSuccessViewController.storyboardIdentifier) as! SignupSuccessViewController
        viewController.viewModel = SignupSuccessViewModel(eventManger: self.eventManager)
        viewController.coordinator = SignupSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.signupCompletion = signupCompletion
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func signupSuccessInvitationCodeViewController(referralCodeEnabled: Bool, errorMessage: String, codeLength: Int, navigationController: UINavigationController) -> SignupSuccessInvitationCodeViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: SignupSuccessInvitationCodeViewController.storyboardIdentifier) as! SignupSuccessInvitationCodeViewController
        let inviteAndEarnService = InviteAndEarnService(apiClient: apiClient)
        viewController.viewModel = SignupSuccessInvitationCodeViewModel(eventManger: self.eventManager, authentication: authentication, inviteAndEarnService: inviteAndEarnService, referralCodeEnabled: referralCodeEnabled, errorMessage: errorMessage, codeLength: codeLength)
        viewController.coordinator = SignupSuccessInvitationCodeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.signupCompletion = signupCompletion
        viewController.title = "Create Account"
        
        return viewController
    }
    
    func minorWelcomeViewController(navigationController: UINavigationController) -> MinorWelcomeViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: MinorWelcomeViewController.storyboardIdentifier) as! MinorWelcomeViewController
        viewController.viewModel = MinorWelcomeViewModel(eventManager: eventManager)
        viewController.coordinator = MinorWelcomeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func minorFormViewController(navigationController: UINavigationController) -> MinorFormViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: MinorFormViewController.storyboardIdentifier) as! MinorFormViewController
        viewController.viewModel = MinorFormViewModel(authentication: authentication, eventManager: eventManager)
        viewController.coordinator = MinorFormCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func minorOTPViewController(request: MinorRequest, navigationController: UINavigationController, otpVerified: @escaping (() -> Void)) -> MinorOTPViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: MinorOTPViewController.storyboardIdentifier) as! MinorOTPViewController
        viewController.viewModel = MinorOTPViewModel(authentication: authentication, request: request, eventManager: eventManager)
        viewController.coordinator = MinorOTPCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.otpVerified = otpVerified
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func minorCNICViewController(request: MinorRequest, navigationController: UINavigationController) -> MinorCNICViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: MinorCNICViewController.storyboardIdentifier) as! MinorCNICViewController
        viewController.viewModel = MinorCNICViewModel(authentication: authentication, request: request, eventManager: eventManager)
        viewController.coordinator = MinorCNICCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func minorParentOTPViewController(request: MinorRequest, navigationController: UINavigationController, otpVerified: @escaping (() -> Void)) -> MinorParentOTPViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: MinorParentOTPViewController.storyboardIdentifier) as! MinorParentOTPViewController
        viewController.viewModel = MinorParentOTPViewModel(authentication: authentication, request: request, eventManager: eventManager)
        viewController.coordinator = MinorParentOTPCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.otpVerified = otpVerified
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func minorPinViewController(request: MinorRequest, navigationController: UINavigationController) -> MinorPinViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: MinorPinViewController.storyboardIdentifier) as! MinorPinViewController
        viewController.viewModel = MinorPinViewModel(authentication: authentication, request: request, eventManager: eventManager)
        viewController.coordinator = MinorPinCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func minorSuccessViewController(navigationController: UINavigationController) -> MinorSuccessViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: MinorSuccessViewController.storyboardIdentifier) as! MinorSuccessViewController
        viewController.viewModel = MinorSuccessViewModel(eventManager: eventManager)
        viewController.coordinator = MinorSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.signupCompletion = signupCompletion
        viewController.title = "Create Account".localized
        
        return viewController
    }
    
    func formBInfoViewController() -> GeneralPopupViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: "FormBInfoViewController") as! GeneralPopupViewController
        return viewController
    }
    
    func parentCnicInfoViewController() -> GeneralPopupViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: "ParentCnicInfoViewController") as! GeneralPopupViewController
        return viewController
    }
    
    func changeLanguageViewController(navigationController: UINavigationController) -> ChangeLanguageViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: ChangeLanguageViewController.storyboardIdentifier) as! ChangeLanguageViewController
        viewController.viewModel = ChangeLanguageViewModel(eventManager: self.eventManager)
        viewController.coordinator = ChangeLanguageCoordinator()
        
        return viewController
    }
    
    func donationDetailViewController(navigationController: UINavigationController, splitBillEnabled: Bool) -> DonationDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: DonationDetailViewController.storyboardIdentifier) as! DonationDetailViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = DonationDetailViewModel(authentication: self.authentication, service: transferMoneyService, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = DonationDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func selectScheduleTranactionsViewController(navigationController: UINavigationController) -> SelectScheduleTranactionsViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: SelectScheduleTranactionsViewController.storyboardIdentifier) as! SelectScheduleTranactionsViewController
        viewController.viewModel = SelectScheduleTranactionsViewModel()
        viewController.coordinator = SelectScheduleTranactionsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func scheduleTransactionsZindigiDetailViewController(navigationController: UINavigationController, splitBillEnabled: Bool) -> ScheduleTransactionsZindigiDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ScheduleTransactionsZindigiDetailViewController.storyboardIdentifier) as! ScheduleTransactionsZindigiDetailViewController
        
        let transferMoney = TransferMoneyService(apiClient: apiClient)
        let scheduleTransaction = ScheduleTransactionService(apiClient: apiClient)
        
        viewController.viewModel = ScheduleTransactionsZindigiDetailViewModel(transferMoney: transferMoney, scheduleTransaction: scheduleTransaction, authentication: authentication, splitBillEnabled: splitBillEnabled)
        
        viewController.coordinator = ScheduleTransactionsZindigiDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func scheduleTransactionsBankSuccessfulViewController(navigationController: UINavigationController, scheduleTransactionSuccessModel: ScheduleTransactionSuccessModel, splitBillEnabled: Bool) -> ScheduleTransactionsBankSuccessfulViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ScheduleTransactionsBankSuccessfulViewController.storyboardIdentifier) as! ScheduleTransactionsBankSuccessfulViewController
        
        viewController.viewModel = ScheduleTransactionsBankSuccessfulViewModel(authentication: authentication, successModel: scheduleTransactionSuccessModel, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ScheduleTransactionsBankSuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func moreMenuViewController(navigationController: UINavigationController) -> MoreMenuViewController {
        let viewController = Storyboard.more.instantiateViewController(identifier: MoreMenuViewController.storyboardIdentifier) as! MoreMenuViewController
        navigationController.pushViewController(viewController, animated: false)
        let zspinservice = ZSpinService(apiClient: apiClient)
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        let stocksService = StocksService(apiClient: apiClient)
        let storage = MoreMenuStorage()
        let service = MoreService(apiClient: apiClient, storage: storage)
        let ultraService = UltraService(apiClient: apiClient)
        let islamicService = IslamicSavingsService(apiClient: apiClient)
        let moveMoneyService = TransferMoneyService(apiClient: apiClient)
        let cardlessCashService = CardlessCashService(apiClient: apiClient)
        let advanceCashService = AdvanceCashService(apiClient: apiClient)
        let campusDirectorService = CampusDirectorService(apiClient: apiClient)
        let loanProductService  = LoanProductService(apiClient: apiClient)
        let splitBillService  = SplitBillService(apiClient: apiClient)
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        let efuService = EFUService(apiClient: apiClient)
        let payViaLinkService = PayViaLinkService(apiClient: apiClient)
        let zSportServices = ZSportServices(apiClient: apiClient)
        let zTagServices  = ZTagServices(apiClient: apiClient)
        
        viewController.viewModel = MoreMenuViewModel(zspinservice, mutualFundsService, authentication: self.authentication, payment: payment, service: service, stocksService: stocksService, mobileNumber: authentication.user.mobileNumber, giftMoneyService: moveMoneyService, cardlessCashService: cardlessCashService, advanceCashService: advanceCashService, campusDirectorService: campusDirectorService, configurations: configurations, ultraService: ultraService, loanProductService: loanProductService, islamicservice: islamicService, fuelPocketService: fuelPocketService, splitBillService: splitBillService, efuService: efuService, payViaLinkService: payViaLinkService, zSportServices: zSportServices, zTagServices: zTagServices)
        viewController.ultraViewModel = UltraEnquiryCallViewModel(authentication: authentication, ultraService: ultraService)
        viewController.coordinator = MoreMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.ultraCoordinator = UltraEnquiryCallViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "More".localized
        
        return viewController
    }
    
    func hamburgerMenuViewController(navigationController: UINavigationController) -> HamburgerMenuViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuViewController.storyboardIdentifier) as! HamburgerMenuViewController
        
        let qrService = QRService(apiClient: apiClient)
        let ultraService = UltraService(apiClient: apiClient)
        let accountCertificateService = AccountCertificatesService(apiClient: apiClient)
        let faqService = FAQService(apiClient: apiClient)
        viewController.viewModel = HamburgerMenuViewModel(authentication: self.authentication, qrService: qrService, chatManager: self.chatManager, configration: self.configurations,  ultraService: ultraService, accountCertificateService: accountCertificateService, eventManager: eventManager, faqService: faqService)
        viewController.ultraViewModel = UltraEnquiryCallViewModel(authentication: authentication, ultraService: ultraService)
        viewController.coordinator = HamburgerMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.ultraCoordinator = UltraEnquiryCallViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.logoutCompletion = logoutCompletion
        viewController.title = "Menu".localized
        return viewController
    }
    
    //MARK: Hamburger Menu Profile
    func hamburgerMenuProfileViewController(navigationController: UINavigationController) -> HamburgerMenuProfileViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuProfileViewController.storyboardIdentifier) as! HamburgerMenuProfileViewController
        viewController.viewModel = HamburgerMenuProfileViewModel(authentication)
        viewController.coordinator = HamburgerMenuProfileCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func hamburgerMenuTransactionLimitsViewController(navigationController: UINavigationController) -> HamburgerMenuTransactionLimitsViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuTransactionLimitsViewController.storyboardIdentifier) as! HamburgerMenuTransactionLimitsViewController
        let ultraService = UltraService(apiClient: apiClient)
        viewController.viewModel = HamburgerMenuTransactionLimitsViewModel(authentication: authentication)
        viewController.ultraViewModel = UltraEnquiryCallViewModel(authentication: authentication, ultraService: ultraService)
        viewController.coordinator = HamburgerMenuTransactionLimitCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.ultraCoordinator = UltraEnquiryCallViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func hamburgerMenuSettingViewController(navigationController: UINavigationController) -> HamburgerMenuSettingViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuSettingViewController.storyboardIdentifier) as! HamburgerMenuSettingViewController
        viewController.viewModel = HamburgerMenuSettingViewModel(authentication: authentication, configurations: configurations)
        viewController.coordinator = HamburgerMenuSettingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func hamburgerMenuAccountSettingChangePinViewController(navigationController: UINavigationController) -> HamburgerMenuAccountSettingChangePinViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuAccountSettingChangePinViewController.storyboardIdentifier) as! HamburgerMenuAccountSettingChangePinViewController
        viewController.viewModel = HamburgerMenuAccountSettingChangePinViewModel(authentication: authentication)
        viewController.coordinator = HamburgerMenuAccountSettingChangePinCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Change PIN".localized
        viewController.loginPinUpdated = logoutCompletion
        return viewController
    }
    
    func hamburgerMenuProfilePictureViewController(navigationController: UINavigationController,imageUploaded: @escaping (() -> Void)) -> HamburgerMenuProfilePictureViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuProfilePictureViewController.storyboardIdentifier) as! HamburgerMenuProfilePictureViewController
        viewController.viewModel = HamburgerMenuProfilePictureViewModel(authentication: authentication)
        viewController.coordinator = HamburgerMenuProfilePictureCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.imageUploaded = imageUploaded
        return viewController
    }
    func hamburgerMenuProfileUpdateNameViewController(navigationController: UINavigationController) -> HamburgerMenuProfileUpdateNameViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuProfileUpdateNameViewController.storyboardIdentifier) as! HamburgerMenuProfileUpdateNameViewController
        viewController.viewModel = HamburgerMenuProfileUpdateNameViewModel(authentication: authentication)
        viewController.coordinator = HamburgerMenuProfileUpdateNameCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func hamburgerMenuFeedbackViewController(navigationController: UINavigationController) -> HamburgerMenuFeedbackViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuFeedbackViewController.storyboardIdentifier) as! HamburgerMenuFeedbackViewController
        viewController.viewModel = HamburgerMenuFeedbackViewModel()
        viewController.coordinator = HamburgerMenuFeedbackCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func hamburgerMenuProfileUpdateEmailViewController(navigationController: UINavigationController, completion: @escaping ((Bool) -> Void) = {_ in }) -> HamburgerMenuProfileUpdateEmailViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuProfileUpdateEmailViewController.storyboardIdentifier) as! HamburgerMenuProfileUpdateEmailViewController
        viewController.viewModel = HamburgerMenuProfileUpdateEmailViewModel(authentication: authentication)
        viewController.coordinator = HamburgerMenuProfileUpdateEmailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.emailVerified = completion
        return viewController
    }
    func hamburgerMenuProfileUpdateOtpViewController(navigationController: UINavigationController, newEmail: String) -> HamburgerMenuProfileUpdateEmailOtpViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuProfileUpdateEmailOtpViewController.storyboardIdentifier) as! HamburgerMenuProfileUpdateEmailOtpViewController
        viewController.viewModel = HamburgerMenuUpdateEmailOtpViewModel(authentication: authentication, newEmail: newEmail)
        viewController.coordinator = HamburgerMenuUpdateEmailOtpCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Update Email".localized
        
        return viewController
    }
    
    func hamburgerMenuUpdateAddressViewController(navigationController: UINavigationController) -> HamburgereMenuUpdateAddressViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgereMenuUpdateAddressViewController.storyboardIdentifier) as! HamburgereMenuUpdateAddressViewController
        viewController.viewModel = HamburgereMenuUpdateAddressViewModel(authentication: authentication)
        viewController.coordinator = HamburgereMenuUpdateAddressCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func hamburgerMenuUpdateNetworkViewController(navigationController: UINavigationController) -> HamburgerMenuUpdateNetworkViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuUpdateNetworkViewController.storyboardIdentifier) as! HamburgerMenuUpdateNetworkViewController
        viewController.viewModel = HamburgerMenuUpdateNetworkViewModel(authentication: authentication)
        viewController.coordinator = HamburgerMenuUpdateNetworkCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func hamburgerMenuUpdateCNICViewController(navigationController: UINavigationController) -> HamburgerMenuUpdateCNICViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuUpdateCNICViewController.storyboardIdentifier) as! HamburgerMenuUpdateCNICViewController
        viewController.viewModel = HamburgerMenuUpdateCNICViewModel(authentication: authentication)
        viewController.coordinator = HamburgerMenuUpdateCNICCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func hamburgerMenuLocateUsViewController(navigationController: UINavigationController, locationType: LocationType) -> HamburgerMenuLocateUsViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuLocateUsViewController.storyboardIdentifier) as! HamburgerMenuLocateUsViewController
        
        let locateUsService = LocateUsService(apiClient: apiClient)
        let locateUs = LocateUs(service: locateUsService)
        viewController.navigationItem.title = "Locate Us".localized
        viewController.viewModel = HamburgerMenuLocateUsViewModel(authentication: authentication, locateUs: locateUs, locationType: locationType)
        viewController.coordinator = HamburgerMenuLocateUsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [
            hamburgerMenuLocateUsBracnchesViewController(navigationController: navigationController),
            hamburgerMenuLocateUsAgentsViewController(navigationController: navigationController),
            hamburgerMenuLocateUsATMsViewController(navigationController: navigationController)]
        return viewController
    }
    
    func hamburgerMenuLocateUsBracnchesViewController(navigationController: UINavigationController) -> HamburgerMenuLocateUsBracnchesViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuLocateUsBracnchesViewController.storyboardIdentifier) as! HamburgerMenuLocateUsBracnchesViewController
        let locateUsService = LocateUsService(apiClient: apiClient)
        let locateUs = LocateUs(service: locateUsService)
        
        viewController.viewModel = HamburgerMenuLocateUsBracnchesViewModel(authentication: authentication, locateUs: locateUs)
        viewController.coordinator = HamburgerMenuLocateUsBracnchesCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func hamburgerMenuLocateUsAgentsViewController(navigationController: UINavigationController) -> HamburgerMenuLocateUsAgentsViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuLocateUsAgentsViewController.storyboardIdentifier) as! HamburgerMenuLocateUsAgentsViewController
        let locateUsService = LocateUsService(apiClient: apiClient)
        let locateUs = LocateUs(service: locateUsService)
        
        viewController.viewModel = HamburgerMenuLocateUsAgentsViewModel(authentication: authentication, locateUs: locateUs)
        viewController.coordinator = HamburgerMenuLocateUsAgentsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
        
    }
    
    func hamburgerMenuLocateUsATMsViewController(navigationController: UINavigationController) -> HamburgerMenuLocateUsATMsViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: HamburgerMenuLocateUsATMsViewController.storyboardIdentifier) as! HamburgerMenuLocateUsATMsViewController
        let locateUsService = LocateUsService(apiClient: apiClient)
        let locateUs = LocateUs(service: locateUsService)
        viewController.viewModel = HamburgerMenuLocateUsATMsViewModel(authentication: authentication, locateUs: locateUs)
        viewController.coordinator = HamburgerMenuLocateUsATMsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    
    
    func hamburgerMenuScheduleofChargesViewController(navigationController: UINavigationController) -> HamburgerMenuScheduleofChargesViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(withIdentifier: HamburgerMenuScheduleofChargesViewController.storyboardIdentifier) as! HamburgerMenuScheduleofChargesViewController
        viewController.viewModel = HamburgerMenuScheduleofChargesViewModel()
        viewController.coordinator = HamburgerMenuScheduleofChargesCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func hamburgerMenuTalkToUsViewController(navigationController: UINavigationController) -> HamburgerMenuTalkToUsViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(withIdentifier: HamburgerMenuTalkToUsViewController.storyboardIdentifier) as! HamburgerMenuTalkToUsViewController
        viewController.viewModel = HamburgerMenuTalkToUsViewModel()
        viewController.coordinator = HamburgerMenuTalkToUsViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
        
    }
    
    func accountSmsAlertViewController(alertText: String, termsText: String, navigationController: UINavigationController) -> AccountSmsAlertViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(withIdentifier: AccountSmsAlertViewController.storyboardIdentifier) as! AccountSmsAlertViewController
        viewController.viewModel = AccountSmsAlertViewModel(authentication: authentication, alertText: alertText, termsText: termsText)
        viewController.coordinator = AccountSmsAlertCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    // todo
    
    func hamburgerMenuFAQSViewController(navigationController: UINavigationController) -> HamburgerMenuFAQSViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(withIdentifier: HamburgerMenuFAQSViewController.storyboardIdentifier) as! HamburgerMenuFAQSViewController
        let faqService = FAQService(apiClient: apiClient)
        
        viewController.viewModel = HamburgerMenuFAQSViewModel(authentication: authentication, faqService: faqService)
        viewController.coordinator = HamburgerMenuFAQSViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func locateUsMapViewController(locationItemModel: LocationItem) -> LocateUsMapViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: LocateUsMapViewController.storyboardIdentifier) as! LocateUsMapViewController
        viewController.title = "Locate Us".localized
        viewController.viewModel = LocationUsMapViewModel(locationItem: locationItemModel)
        
        return viewController
    }
    
    func faqDetailViewController(navigationController: UINavigationController, faqQuestion: FAQModel) -> FaqDetailViewController {
        let viewController = Storyboard.hamBurgerMenu.instantiateViewController(identifier: FaqDetailViewController.storyboardIdentifier) as! FaqDetailViewController
        viewController.faqQuestion = faqQuestion
        viewController.viewModel = FaqDetailViewModel(chatManager: chatManager, intercomEnabled: configurations.isIntercomEnabled)
        viewController.coordinator = FaqDetailViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func scheduleTransactionsZindigiReviewViewController(reviewData: ScheduleTransactionReviewModel, navigationController: UINavigationController, splitBillEnabled: Bool) -> ScheduleTransactionZindigiReviewViewController {
        
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ScheduleTransactionZindigiReviewViewController.storyboardIdentifier) as! ScheduleTransactionZindigiReviewViewController
        let scheduleTransaction = ScheduleTransactionService(apiClient: apiClient)
        viewController.title = "Review Details".localized
        viewController.viewModel = ScheduleTransactionZindigiReviewViewModel(authentication: self.authentication, scheduleTransaction: scheduleTransaction, reviewData: reviewData, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ScheduleTransactionZindigiReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func scheduleTransactionsBankReviewViewController(reviewData: ScheduleTransactionReviewModel, navigationController: UINavigationController, isJSBank: Bool, splitBillEnabled: Bool) -> ScheduleTransactionsBankReviewViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ScheduleTransactionsBankReviewViewController.storyboardIdentifier) as! ScheduleTransactionsBankReviewViewController
        let scheduleTransaction = ScheduleTransactionService(apiClient: apiClient)
        
        viewController.viewModel = ScheduleTransactionsBankReviewViewModel(authentication: self.authentication, scheduleTransaction: scheduleTransaction, reviewData: reviewData, isJSBank: isJSBank, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ScheduleTransactionsBankReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func scheduleTransactionsBankDetailViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> ScheduleTransactionsBankDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ScheduleTransactionsBankDetailViewController.storyboardIdentifier) as! ScheduleTransactionsBankDetailViewController
        
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        let scheduleTransaction = ScheduleTransactionService(apiClient: apiClient)
        
        viewController.viewModel = ScheduleTransactionsBankDetailViewModel(transferMoney: transferMoneyService, scheduleTransaction: scheduleTransaction, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ScheduleTransactionsBankDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func scheduleTransactionsHistorySuccessfulViewController(navigationController: UINavigationController,transactionHistory: TransactionDataItemResponse, splitBillEnabled: Bool) -> ScheduleTransactionsHistorySuccessfulViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ScheduleTransactionsHistorySuccessfulViewController.storyboardIdentifier) as! ScheduleTransactionsHistorySuccessfulViewController
        let scheduleTransaction = ScheduleTransactionService(apiClient: apiClient)
        viewController.viewModel = ScheduleTransactionsHistorySuccessfulViewModel(authentication: self.authentication,transactionHistory: transactionHistory, scheduleTransaction: scheduleTransaction, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ScheduleTransactionsHistorySuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func internationalRemittenceDetailViewController(navigationController: UINavigationController, splitBillEnabled: Bool) -> InternationalRemittenceDetailViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: InternationalRemittenceDetailViewController.storyboardIdentifier) as! InternationalRemittenceDetailViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = InternationalRemittenceDetailViewModel(transferMoney: transferMoneyService, authentication: self.authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = InternationalRemittenceDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func internationalRemittenceAddAmountViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> InternationalRemittenceAddAmountViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: InternationalRemittenceAddAmountViewController.storyboardIdentifier) as! InternationalRemittenceAddAmountViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = InternationalRemittenceAddAmountViewModel(transferMoney: transferMoneyService, authentication: self.authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = InternationalRemittenceAddAmountCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func internationalRemittenceCnicViewController(navigationController: UINavigationController, request: InternationalRemmittenceRequest) -> InternationalRemittenceCnicViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: InternationalRemittenceCnicViewController.storyboardIdentifier) as! InternationalRemittenceCnicViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = InternationalRemittenceCnicViewModel(transferMoney: transferMoneyService,request: request)
        viewController.coordinator = InternationalRemittenceCnicCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func internationalRemittenceIncomeViewController(navigationController: UINavigationController,request: InternationalRemmittenceRequest) -> InternationalRemittenceIncomeViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: InternationalRemittenceIncomeViewController.storyboardIdentifier) as! InternationalRemittenceIncomeViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = InternationalRemittenceIncomeViewModel(transferMoney: transferMoneyService, request: request)
        viewController.coordinator = InternationalRemittenceIncomeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func internationalRemittenceKinViewController(navigationController: UINavigationController,request: InternationalRemmittenceRequest) -> InternationalRemittenceKinViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: InternationalRemittenceKinViewController.storyboardIdentifier) as! InternationalRemittenceKinViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = InternationalRemittenceKinViewModel(transferMoney: transferMoneyService, request: request)
        viewController.coordinator = InternationalRemittenceKinCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func internationalRemittenceOtherViewController(navigationController: UINavigationController,request: InternationalRemmittenceRequest) -> InternationalRemittenceOtherViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: InternationalRemittenceOtherViewController.storyboardIdentifier) as! InternationalRemittenceOtherViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = InternationalRemittenceOtherViewModel(transferMoney: transferMoneyService, request: request, mobileNumber: authentication.user.mobileNumber, name: authentication.account.nadraAccountTitle ?? "", dateOfBirth: authentication.user.dateofBirth ?? "", authentication: self.authentication)
        viewController.coordinator = InternationalRemittenceOtherCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func donationTransferSuccessfulViewController(navigationController: UINavigationController, receiptModel : TransferPaymentReceipt? = nil, splitBillEnabled: Bool, completion: @escaping (() -> Void)) -> DonationTransferSuccessfulViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: DonationTransferSuccessfulViewController.storyboardIdentifier) as! DonationTransferSuccessfulViewController
        viewController.viewModel = DonationTransferSuccessfulViewModel(authentication: authentication, receiptModel:receiptModel, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = DonationTransferSuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        return viewController
    }
    
    func selectGiftViewController(navigationController: UINavigationController, giftMoneyItems: GiftMoneyItemsBody, splitBillEnabled: Bool) -> SelectGiftViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: SelectGiftViewController.storyboardIdentifier) as! SelectGiftViewController
        let service = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = SelectGiftViewModel(giftMoneyItems: giftMoneyItems, authentication: authentication, giftMoneyService: service, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = SelectGiftCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func recentsRequestMoneyViewController(navigationController: UINavigationController, recentScreenCase: RequestGiftMoney, splitBillEnabled : Bool) -> RecentsRequestMoneyViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: RecentsRequestMoneyViewController.storyboardIdentifier) as! RecentsRequestMoneyViewController
        let service = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = RecentsRequestMoneyViewModel(service: service, authentication: self.authentication, recentScreenCase: recentScreenCase, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = RecentsRequestMoneyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    //MARK: - Loans Module ViewControllers
    func advanceCashIndroductionViewController(model: OptasiaInquiryBodyResponse?, navigationController: UINavigationController, productId: String) -> AdvanceCashIndroductionViewController {
        let viewController = Storyboard.loans.instantiateViewController(withIdentifier: AdvanceCashIndroductionViewController.storyboardIdentifier) as! AdvanceCashIndroductionViewController
        viewController.coordinator = AdvanceCashOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewModel = AdvanceCashIndroductionViewModel(model: model, productId: productId)
        viewController.title = "Advance Cash".localized
        return viewController
    }
    
    func advanceCashHowIsWorkViewController(model: OptasiaInquiryBodyResponse, navigationController: UINavigationController, productId: String) -> AdvanceCashHowIsWorkViewController {
        let viewController = Storyboard.loans.instantiateViewController(withIdentifier: AdvanceCashHowIsWorkViewController.storyboardIdentifier) as! AdvanceCashHowIsWorkViewController
        viewController.coordinator = AdvanceCashOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewModel = AdvanceCashHowIsWorkViewModel(model: model, productId: productId)
        viewController.title = "Advance Cash".localized
        return viewController
    }
    func loansMenuViewController(navigationController: UINavigationController) -> LoansMenuViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: LoansMenuViewController.storyboardIdentifier) as! LoansMenuViewController
        viewController.title = "Loans".localized
        let service = AdvanceCashService(apiClient: apiClient)
        let loanProductService = LoanProductService(apiClient: apiClient)
        viewController.viewModel = LoansMenuViewModel(service: service, authentication: authentication, loanProductService: loanProductService)
        viewController.coordinator = LoansMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func advanceSalaryMenuViewController(navigationController: UINavigationController) -> AdvanceSalaryMenuViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: AdvanceSalaryMenuViewController.storyboardIdentifier) as! AdvanceSalaryMenuViewController
        viewController.title = "Advance Salary".localized
        let service = AdvanceSalaryService(apiClient: apiClient)
        viewController.viewModel = AdvanceSalaryMenuViewModel(advanceSalaryService: service, authentication: authentication)
        viewController.coordinator = AdvanceSalaryMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func advanceSalaryLandingViewController(navigationController: UINavigationController) -> AdvanceSalaryLandingViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: AdvanceSalaryLandingViewController.storyboardIdentifier) as! AdvanceSalaryLandingViewController
        viewController.title = "Advance Salary".localized
        viewController.viewModel = AdvanceSalaryLandingViewModel()
        viewController.coordinator = AdvanceSalaryLandingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func advanceCashOnBoardingViewController(navigationController: UINavigationController) -> AdvanceSalaryOnBoardingViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: AdvanceSalaryOnBoardingViewController.storyboardIdentifier) as! AdvanceSalaryOnBoardingViewController
        viewController.title = "Advance Salary".localized
        viewController.viewModel = AdvanceSalaryOnBoardingViewModel()
        viewController.coordinator = AdvanceSalaryOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func applyAdvanceSalaryViewController(navigationController: UINavigationController) -> ApplyAdvanceSalaryViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: ApplyAdvanceSalaryViewController.storyboardIdentifier) as! ApplyAdvanceSalaryViewController
        viewController.title = "Request Processing".localized
        let service = AdvanceSalaryService(apiClient: apiClient)
        viewController.viewModel = ApplyAdvanceSalaryViewModel(service: service, authentication: authentication)
        viewController.coordinator = ApplyAdvanceSalaryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func loansHistoryViewController(navigationController: UINavigationController) -> LoansHistoryViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: LoansHistoryViewController.storyboardIdentifier) as! LoansHistoryViewController
        viewController.title = "History".localized
        let service = AdvanceSalaryService(apiClient: apiClient)
        viewController.viewModel = LoansHistoryViewModel(service: service, authentication: authentication)
        viewController.coordinator = LoansHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func loanDetailsViewController(loanDetails: LoanHistoryData, navigationController: UINavigationController) -> LoanDetailsViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: LoanDetailsViewController.storyboardIdentifier) as! LoanDetailsViewController
        viewController.title = "History".localized
        viewController.viewModel = LoanDetailsViewModel(loanDetails: loanDetails)
        viewController.coordinator = LoanDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func selfRepaymentViewController(selfRepaymentData: SelfRepaymentModel, navigationController: UINavigationController) -> SelfRepaymentViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: SelfRepaymentViewController.storyboardIdentifier) as! SelfRepaymentViewController
        viewController.title = "Review Details".localized
        let service = AdvanceSalaryService(apiClient: apiClient)
        viewController.viewModel = SelfRepaymentViewModel(service: service, selfRepayment: selfRepaymentData, authentication: authentication)
        viewController.coordinator = SelfRepaymentCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func advanceSalaryRepaymentSuccessViewController(selfRepaymentData: SelfRepaymentModel, navigationController: UINavigationController) -> AdvanceSalaryRepaymentSuccessViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: AdvanceSalaryRepaymentSuccessViewController.storyboardIdentifier) as! AdvanceSalaryRepaymentSuccessViewController
        viewController.viewModel = AdvanceSalaryRepaymentScuuessViewModel(selfRepaymentData: selfRepaymentData, authentication: authentication)
        viewController.coordinator = AdvanceSalaryRepaymentSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func advanceCashLandingViewController(navigationController: UINavigationController) -> AdvanceCashLandingViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: AdvanceCashLandingViewController.storyboardIdentifier) as! AdvanceCashLandingViewController
        viewController.title = "Advance Cash".localized
        viewController.viewModel = AdvanceCashLandingViewModel()
        viewController.coordinator = AdvanceCashLandingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func applyAdvanceCashViewController(optasiaInquiryBodyResponse: OptasiaInquiryBodyResponse ,navigationController: UINavigationController, productId: String) -> ApplyAdvanceCashViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: ApplyAdvanceCashViewController.storyboardIdentifier) as! ApplyAdvanceCashViewController
        viewController.title = "Advance Cash".localized
        let service = AdvanceCashService(apiClient: apiClient)
        viewController.viewModel = ApplyAdvanceCashViewModel(service: service, authentication: self.authentication, optasiaInquiryBodyResponse: optasiaInquiryBodyResponse, productId: productId)
        viewController.coordinator = ApplyAdvanceCashCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func advanceCashHistoryViewController(navigationController: UINavigationController, productId: String) -> AdvanceCashHistoryViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: AdvanceCashHistoryViewController.storyboardIdentifier) as! AdvanceCashHistoryViewController
        viewController.title = "History".localized
        let service = AdvanceCashService(apiClient: apiClient)
        viewController.viewModel = AdvanceCashHistoryViewModel(service: service, mobileNumber: self.authentication.user.mobileNumber, productId: productId)
        viewController.coordinator = AdvanceCashHistoryCoordinator(viewControllerFacctory: self, navigationController: navigationController)
        
        return viewController
    }
    
    func loanPaymentPlanViewController(optasiaLoanPlanCalculation: OptasiaLoanPlanCalculationBodyResponse, navigationController: UINavigationController) -> LoanPaymentPlanViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: LoanPaymentPlanViewController.storyboardIdentifier) as! LoanPaymentPlanViewController
        viewController.viewModel = LoanPaymentPlanViewModel(optasiaLoanPlanCalculation: optasiaLoanPlanCalculation)
        viewController.coordinator = LoanPaymentPlanCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func advanceCashReviewDetailsViewController(accountTitle: String, mobile: String, offerName: String, serviceFee: String, processingFee: String, amount: String, maturityDuration: String, dueDate: String, loanStartDate: String, loanEndDate: String, purposeOfLoan: String, navigationController: UINavigationController, productId: String, repaymentMethodId: String) -> AdvanceCashReviewDetailsViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: AdvanceCashReviewDetailsViewController.storyboardIdentifier) as! AdvanceCashReviewDetailsViewController
        viewController.title = "Review Details".localized
        let service = AdvanceCashService(apiClient: apiClient)
        viewController.viewModel = AdvanceCashReviewDetailsViewModel(accouuntTitle: accountTitle, mobile: mobile, offerName: offerName, serviceFee: serviceFee, processingFee: processingFee, amount: amount, maturityDuration: maturityDuration, dueDate: dueDate, loanStartDate: loanStartDate, loanEndDate: loanEndDate, purposeOfLoan: purposeOfLoan, service: service, productId: productId, repaymentMethodId: repaymentMethodId)
        viewController.coordinator = AdvanceCashReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func advanceCashReceiptViewController(accountTitle: String, mobile: String, processingFee: String, amount: String, message: String, transactionId: String, navigationController: UINavigationController, completion: @escaping (() -> Void)) -> AdvanceCashReceiptViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: AdvanceCashReceiptViewController.storyboardIdentifier) as! AdvanceCashReceiptViewController
        viewController.title = "Review Details".localized
        viewController.viewModel = AdvanceCashReceiptViewModel(accountTitle: accountTitle, mobile: mobile, processingFee: processingFee, amount: amount, advanceMessage: message, transactionId: transactionId)
        viewController.coordinator = AdvanceCashReceiptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.completion = completion
        
        return viewController
    }
    
    func cashRepaymentViewController(optasiaLoanOutstanding: OptasiaLoanOutstandingResponse, navigationController: UINavigationController, productId: String) -> CashRepaymentViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: CashRepaymentViewController.storyboardIdentifier) as! CashRepaymentViewController
        viewController.title = "Advance Cash".localized
        let service = AdvanceCashService(apiClient: apiClient)
        viewController.viewModel = CashRepaymentViewModel(service: service, authentication: self.authentication, optasiaLoanOutstanding: optasiaLoanOutstanding, productId: productId)
        viewController.coordinator = CashRepaymentCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func cashRepaymentReviewViewController(accountTitle: String, mobile: String, outStandingLoan: String, loanAmount: String, serviceFee: String, navigationController: UINavigationController, productId: String) -> CashRepaymentReviewViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: CashRepaymentReviewViewController.storyboardIdentifier) as! CashRepaymentReviewViewController
        viewController.title = "Review Details".localized
        let service = AdvanceCashService(apiClient: apiClient)
        viewController.viewModel = CashRepaymentReviewViewModel(accountTitle: accountTitle, mobile: mobile, outStandingLoan: outStandingLoan, loanAmount: loanAmount, serviceFee: serviceFee, service: service, productId: productId)
        viewController.coordinator = CashRepaymentReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func loanProductMenuViewController(lmsProductId: String, loanProductItems: LMSConfigBodyResponse, navigationController: UINavigationController, productID: Int,  navigationTitle: String) -> LoanProductMenuViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanProductMenuViewController.storyboardIdentifier) as! LoanProductMenuViewController
        let service = LoanProductService(apiClient: apiClient)
        viewController.navigationTitle = navigationTitle
        viewController.viewModel = LoanProductMenuViewModel(lmsProductID: lmsProductId, loanProductItems: loanProductItems, authentication: self.authentication, loanProductService: service, productID: productID)
        viewController.coordinator = LoanProductMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func loanProductDurationViewController(lmsProductID: String, loanProductItems: LMSConfigBodyResponse, navigationController: UINavigationController , productId : Int, navigationTitle: String) -> LoanProductDurationViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanProductDurationViewController.storyboardIdentifier) as! LoanProductDurationViewController
        viewController.navigationTitle = navigationTitle
        let service = LoanProductService(apiClient: apiClient)
        viewController.viewModel = LoanProductDurationViewModel(lmsProductID: lmsProductID, loanProductItems: loanProductItems, loanProductService: service, authentication: authentication,productId: productId)
        viewController.coordinator = LoanProductDurationCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func applyForLoanViewController(navigationController: UINavigationController , loanProductResponse: GetPoductDetailResponse,  selectedLoanProduct : LoanProductResponse, productId : Int, navigationTitle : String) -> ApplyForLoanViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: ApplyForLoanViewController.storyboardIdentifier) as! ApplyForLoanViewController
        viewController.navigationTitle = navigationTitle
        let service = LoanProductService(apiClient: apiClient)
        viewController.viewModel = ApplyForLoanViewModel(loanProductService: service, authentication: self.authentication, loanProductResponse: loanProductResponse, selectedLoanProduct : selectedLoanProduct, productId: productId)
        viewController.coordinator = ApplyForLoanCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func repaymentPlanViewController(lmsInqueryDaya: InquiryLoanResponse, navigationController: UINavigationController) -> RepaymentPlanViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: RepaymentPlanViewController.storyboardIdentifier) as! RepaymentPlanViewController
        viewController.lmsInqueryDaya = lmsInqueryDaya
        
        return viewController
    }
    func loanReviewDetailsViewController(navigationController: UINavigationController, receiptDataModel: ReceiptDataModel, loanInquery: InquiryLoanResponse) -> LoanReviewDetailsViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanReviewDetailsViewController.storyboardIdentifier) as! LoanReviewDetailsViewController
        viewController.title = "Review Details".localized
        let service = LoanProductService(apiClient: apiClient)
        viewController.viewModel = LoanReviewDetailsViewModel(loanProductService: service, authentication: authentication, receiptDataModel: receiptDataModel, loanInquery: loanInquery)
        viewController.coordinator = LoanReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func cashRepaymentReceiptViewController(accountTitle: String, mobile: String, outStandingLoan: String, loanAmount: String, serviceFee: String, transactionId: String, navigationController: UINavigationController) -> CashRepaymentReceiptViewController {
        let viewController = Storyboard.loans.instantiateViewController(identifier: CashRepaymentReceiptViewController.storyboardIdentifier) as! CashRepaymentReceiptViewController
        viewController.viewModel = CashRepaymentReceiptViewModel(accountTitle: accountTitle, mobile: mobile, outStandingLoan: outStandingLoan, loanAmount: loanAmount, serviceFee: serviceFee, transactionId: transactionId)
        viewController.coordinator = CashRepaymentReceiptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func scheduleTransactionViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> ScheduleTransactionViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ScheduleTransactionViewController.storyboardIdentifier) as! ScheduleTransactionViewController
        viewController.viewModel = ScheduleTransactionViewModel(splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ScheduleTransactionCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func contactListViewController(navigationController: UINavigationController, isAllContact: Bool = false, titleText: String, onlyZindigiContacts: Bool = false, completion: @escaping ((ContactItem) -> Void)) -> ContactListViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ContactListViewController.storyboardIdentifier) as! ContactListViewController
        let contactService = ContactService(apiClient: apiClient)
        viewController.viewModel = ContactListViewModel(contact: contactService, userID: authentication.user.userID ?? 0, mobile: authentication.user.mobileNumber, isAllContact: isAllContact, titleText: titleText, onlyZindigiContacts: onlyZindigiContacts)
        viewController.coordinator = ContactListCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.completion = completion
        return viewController
    }
    
    
    func spinandwinOnboardingViewController(wheelItems: [WheelItemsResponse], termsAndConditions: [String],navigationController: UINavigationController) -> SpinAndWinOnboardingViewController {
        let viewController = Storyboard.spinandwin.instantiateViewController(identifier: SpinAndWinOnboardingViewController.storyboardIdentifier) as! SpinAndWinOnboardingViewController
        viewController.viewModel = SpinAndWinOnboardingViewModel(wheelItems, termsAndConditions: termsAndConditions)
        viewController.coordinator = SpinAndWinOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Spin & Win".localized
        return viewController
    }
    
    func spinandwinHowitWorksViewController(wheelItems: [WheelItemsResponse], termsAndConditions: [String], navigationController: UINavigationController) -> SpinAndWinHowItWorksViewController {
        let viewController = Storyboard.spinandwin.instantiateViewController(identifier: SpinAndWinHowItWorksViewController.storyboardIdentifier) as! SpinAndWinHowItWorksViewController
        viewController.viewModel = SpinAndWinHowItWorksViewModel(wheelItems, termsAndConditions: termsAndConditions)
        viewController.coordinator = SpinAndWinHowItWorksCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Spin & Win".localized
        return viewController
    }
    
    func tryYourLuckViewController(wheelItems: [WheelItemsResponse], termsAndConditions: [String], navigationController: UINavigationController) -> TryYourLuckViewController {
        let viewController = Storyboard.spinandwin.instantiateViewController(identifier: TryYourLuckViewController.storyboardIdentifier) as! TryYourLuckViewController
        let zspinservice = ZSpinService(apiClient: apiClient)
        viewController.viewModel = TryYourLuckViewModel(zspinservice, authentication: self.authentication, wheelItems: wheelItems, termsAndConditions: termsAndConditions)
        viewController.coordinator = TryYourLuckCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Spin & Win".localized
        return viewController
    }
    
    func termsAndConditionsViewController(termsAndConditions: [String], navigationController: UINavigationController) -> TermsAndConditionsViewController {
        let viewController = Storyboard.spinandwin.instantiateViewController(identifier: TermsAndConditionsViewController.storyboardIdentifier) as! TermsAndConditionsViewController
        viewController.viewModel = TermsAndConditionsViewModel(termsAndConditions)
        viewController.coordinator = TermsAndConditionsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func rewardAlertViewController(reward: String, text: String, image: String, hideSocialMedia: Bool, navigationController: UINavigationController) -> RewardAlertViewController {
        let viewController = Storyboard.spinandwin.instantiateViewController(identifier: RewardAlertViewController.storyboardIdentifier) as! RewardAlertViewController
        viewController.viewModel = RewardAlertViewModel(reward, text: text, image: image, hideSocialMedia: hideSocialMedia)
        viewController.coordinator = RewardAlertCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func spinAndWinHistoryViewController(navigationController: UINavigationController) -> SpinAndWinHistoryViewController {
        let viewController = Storyboard.spinandwin.instantiateViewController(identifier: SpinAndWinHistoryViewController.storyboardIdentifier) as! SpinAndWinHistoryViewController
        let zspinservice = ZSpinService(apiClient: apiClient)
        viewController.viewModel = SpinAndWinHistoryViewModel(zspinservice, authentication: self.authentication)
        viewController.coordinator = SpinAndWinHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "History".localized
        return viewController
    }
    
    func zspinTabBarViewController(navigationController: UINavigationController) -> ZspinTabBarViewController {
        let viewController = Storyboard.spinandwin.instantiateViewController(identifier: ZspinTabBarViewController.storyboardIdentifier) as! ZspinTabBarViewController
        let zspinservice = ZSpinService(apiClient: apiClient)
        viewController.viewModel = ZspinTabBarViewModel(authentication: authentication, zSpinService: zspinservice)
        viewController.coordinator = ZspinTabBarCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Spin & Win".localized
        return viewController
    }
    
    // MARK: - Telco Module ViewControllers
    func telcoMenuViewController(navigationController: UINavigationController) -> TelcoMenuViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: TelcoMenuViewController.storyboardIdentifier) as! TelcoMenuViewController
        viewController.title = "Mobile Load & Bundles".localized
        viewController.viewModel = TelcoMenuViewModel()
        viewController.coordinator = TelcoMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func mobileLoadPostpaidContainerViewController(regularData: MobileLoadRegulars? = nil, navigationController: UINavigationController) -> MobileLoadPostpaidContainerViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileLoadPostpaidContainerViewController.storyboardIdentifier) as! MobileLoadPostpaidContainerViewController
        viewController.title = "Mobile Load".localized
        viewController.viewModel = MobileLoadPostpaidContainerViewModel()
        viewController.viewControllerItems = [
            mobileLoadPostpaidViewController(regularData: regularData, navigationController: navigationController),
            mobileLoadRecentsViewController(navigationController: navigationController)
        ]
        viewController.coordinator = MobileLoadPostpaidContainerCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func mobileLoadPrepaidContainerViewController(navigationController: UINavigationController) -> MobileLoadPrepaidContainerViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileLoadPrepaidContainerViewController.storyboardIdentifier) as! MobileLoadPrepaidContainerViewController
        viewController.title = "Mobile Load Prepaid".localized
        viewController.viewModel = MobileLoadPostpaidContainerViewModel()
        viewController.viewControllerItems = [
            mobileLoadPrepaidViewController(navigationController: navigationController),
            transactionRecentViewController(navigationController: navigationController)
        ]
        viewController.coordinator = MobileLoadPostpaidContainerCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func mobileLoadPostpaidViewController(regularData: MobileLoadRegulars? = nil, navigationController: UINavigationController) -> MobileLoadPostpaidViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileLoadPostpaidViewController.storyboardIdentifier) as! MobileLoadPostpaidViewController
        let paymentService = TelcoPaymentService(apiClient: apiClient)
        viewController.viewModel = MobileLoadPostpaidViewModel(paymentService, authentication: self.authentication, regularData: regularData)
        viewController.title = "Mobile Load".localized
        viewController.coordinator = MobileLoadPostpaidCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func mobileLoadRecentsViewController(navigationController: UINavigationController) -> MobileLoadRecentsViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileLoadRecentsViewController.storyboardIdentifier) as! MobileLoadRecentsViewController
        let paymentService = TelcoPaymentService(apiClient: apiClient)
        viewController.viewModel = MobileLoadRecentsViewModel(paymentService: paymentService, authentication: self.authentication)
        viewController.coordinator = MobileLoadRecentsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func editMobileLoadRecentViewController(navigationController: UINavigationController) -> EditMobileLoadRecentViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: EditMobileLoadRecentViewController.storyboardIdentifier) as! EditMobileLoadRecentViewController
        return viewController
    }
    
    func editMobileLoadRecentNameViewController(name: String, navigationController: UINavigationController) -> EditMobileLoadRecentNameViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: EditMobileLoadRecentNameViewController.storyboardIdentifier) as! EditMobileLoadRecentNameViewController
        viewController.viewModel = EditMobileLoadRecentNameViewModel(name: name)
        return viewController
    }
    
    func mobileLoadPrepaidViewController(navigationController: UINavigationController) -> MobileLoadPrepaidViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileLoadPrepaidViewController.storyboardIdentifier) as! MobileLoadPrepaidViewController
        let paymentService = TelcoPaymentService(apiClient: apiClient)
        viewController.viewModel = MobileLoadPrepaidViewModel(paymentService)
        viewController.coordinator = MobileLoadPrepaidCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func mobileLoadReviewDetailsViewController(recieverMobileNo: String, reciverName: String, companyId: Int, company: String, companyAction : String, productId: String, amount: String, fee: String, isPrepaid: Bool, navigationController: UINavigationController) -> MobileLoadReviewDetailsViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileLoadReviewDetailsViewController.storyboardIdentifier) as! MobileLoadReviewDetailsViewController
        viewController.title = "Review Details".localized
        let paymentService = TelcoPaymentService(apiClient: apiClient)
        viewController.viewModel = MobileLoadReviewDetailsViewModel(paymentService, authentication: self.authentication, recieverMobileNo: recieverMobileNo, reciverName: reciverName, companyId: companyId, company: company, companyAction: companyAction, productId: productId, amount: amount, fee: fee, isPrepaid: isPrepaid)
        viewController.coordinator = MobileLoadReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func mobileLoadPaymentReceiptViewController(receieverMobileNo: String, receiverName: String, companyId: Int, company: String, amount: String, fee: String, transactionID : String, navigationController: UINavigationController, completion: @escaping (() -> Void)) -> MobileLoadPaymentReceiptViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileLoadPaymentReceiptViewController.storyboardIdentifier) as! MobileLoadPaymentReceiptViewController
        viewController.viewModel = MobileLoadPaymentReceiptViewModel(authentication: self.authentication, recieverMobileNo: receieverMobileNo, reciverName: receiverName, companyId: companyId, company: company, amount: amount, fee: fee, transactionID: transactionID)
        viewController.coordinator = MobileLoadPaymentReceiptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.completion = completion
        
        return viewController
    }
    
    func mobileBundlePaymentReceiptViewController(receieverMobileNo: String, receiverName: String, company: String, bundleName: String, amount: String, fee: String, transactionID: String, navigationController: UINavigationController, completion: @escaping (() -> Void)) -> MobileBundlePaymentReceiptViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileBundlePaymentReceiptViewController.storyboardIdentifier) as! MobileBundlePaymentReceiptViewController
        viewController.viewModel = MobileBundlePaymentReceiptViewModel(authentication: authentication, recieverMobileNo: receieverMobileNo, receiverName: receiverName, company: company, bundleName: bundleName, amount: amount, fee: fee,transactionID: transactionID)
        viewController.coordinator = MobileBundlePaymentReceiptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.completion = completion
        
        return viewController
    }
    
    func mobileBundleListViewController(navigationController: UINavigationController) -> MobileBundleListViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileBundleListViewController.storyboardIdentifier) as! MobileBundleListViewController
        viewController.title = "Mobile Bundles".localized
        let paymentService = TelcoPaymentService(apiClient: apiClient)
        viewController.viewModel = MobileBundleListViewModel(paymentService: paymentService, mobileNumber: authentication.user.mobileNumber)
        viewController.coordinator = MobileBundleListCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func recentMobileBundleListViewController(navigationController: UINavigationController) -> RecentMobileBundleListViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: RecentMobileBundleListViewController.storyboardIdentifier) as! RecentMobileBundleListViewController
        viewController.title = "Recent Mobile Bundles".localized
        viewController.viewModel = RecentMobileBundleListViewModel()
        viewController.coordinator = RecentMobileBundleListCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func buyMobileBundleListViewController(companyId: String, companyLogoURL: String, bundle: BundleProduct, navigationController: UINavigationController) -> BuyMobileBundleViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: BuyMobileBundleViewController.storyboardIdentifier) as! BuyMobileBundleViewController
        viewController.title = "Mobile Bundle".localized
        viewController.viewModel = BuyMobileBundleViewModel(companyId: companyId, companyLogoURL: companyLogoURL, bundle: bundle)
        viewController.coordinator = BuyMobileBundleCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func mobileBundleReviewDetailsViewController(companyId: String, companyLogoURL: String, bundle: BundleProduct, receiverName: String, receiverNumber: String, navigationController: UINavigationController) -> MobileBundleReviewDetailsViewController {
        let viewController = Storyboard.telco.instantiateViewController(identifier: MobileBundleReviewDetailsViewController.storyboardIdentifier) as! MobileBundleReviewDetailsViewController
        viewController.title = "Review Details".localized
        let paymentService = TelcoPaymentService(apiClient: apiClient)
        viewController.viewModel = MobileBundleReviewDetailsViewModel(paymentService: paymentService, authentication: authentication, companyId: companyId, companyLogoURL: companyLogoURL, bundle: bundle, receiverName: receiverName, receiverNumber: receiverNumber)
        viewController.coordinator = MobileBundleReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func utilityBillDetailViewControler(category: PaymentMainCategory, payload: RecentPaymentPayload? = nil, navigationController: UINavigationController) -> UtilityBillDetailViewControler {
        let viewController = Storyboard.payment.instantiateViewController(identifier: UtilityBillDetailViewControler.storyboardIdentifier) as! UtilityBillDetailViewControler
        viewController.payload = payload
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        let request = PaymentRequest(authentication: authentication)
        viewController.viewModel = UtilityBillDetailViewModel(payment: payment, request: request, category: category)
        viewController.coordinator = UtilityBillDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = category.categoryName
        return viewController
    }
    
    func selectBillingCategoryViewController(asCompany: Bool, mainCategory: PaymentMainCategory, navigationController: UINavigationController) -> SelectBillingCategoryViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: SelectBillingCategoryViewController.storyboardIdentifier) as! SelectBillingCategoryViewController
        viewController.mainCategory = mainCategory
        viewController.title = asCompany ? "Select Company".localized : "Select Category".localized
        
        return viewController
    }
    
    func selectBillingCompanyViewController(asBank: Bool = false, subCategory: PaymentSubCategory, navigationController: UINavigationController) -> SelectBillingCompanyViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: SelectBillingCompanyViewController.storyboardIdentifier) as! SelectBillingCompanyViewController
        viewController.subCategory = subCategory
        viewController.isBank = asBank
        return viewController
    }
    
    func utlityBillReviewViewController(request: PaymentRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> UtlityBillReviewViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: UtlityBillReviewViewController.storyboardIdentifier) as! UtlityBillReviewViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let zMileService = ZMilesService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        
        viewController.viewModel = UtlityBillReviewViewModel(payment: payment, request: request, authentication: authentication, zMilesService: zMileService, zMilesEnabled: self.configurations.isZmilesRegistered, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = UtlityBillReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        
        return viewController
    }
    func utilityBillSuccessfulViewController(receipt: PaymentReceipt, navigationController: UINavigationController, splitBillEnabled : Bool) -> UtilityBillSuccessfulViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: UtilityBillSuccessfulViewController.storyboardIdentifier) as! UtilityBillSuccessfulViewController
        viewController.receipt = receipt
        viewController.viewModel = UtilityBillSuccessfulViewModel(splitBillEnabled: splitBillEnabled)
        viewController.coordinator = UtilityBillSuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func otherPaymentDetailViewController(category: PaymentMainCategory, payload: RecentPaymentPayload? = nil, mTagItem: MTagDataItem? = nil, navigationController: UINavigationController) -> OtherPaymentDetailViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: OtherPaymentDetailViewController.storyboardIdentifier) as! OtherPaymentDetailViewController
        viewController.payload = payload
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        let request = PaymentRequest(authentication: authentication)
        viewController.viewModel = OtherPaymentDetailViewModel(payment: payment, request: request, category: category, mTagItem: mTagItem)
        viewController.coordinator = OtherPaymentDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = category.categoryName
        
        return viewController
    }
    func paymentRecentsViewController(navigationController: UINavigationController) -> PaymentRecentsViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: PaymentRecentsViewController.storyboardIdentifier) as! PaymentRecentsViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        viewController.viewModel = PaymentRecentsViewModel(payment: payment, authentication: authentication)
        viewController.coordinator = PaymentRecentsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func ticketingWebViewViewController(navigationController: UINavigationController) -> TicketingWebViewViewController {
        let viewController = Storyboard.ticketing.instantiateViewController(identifier: TicketingWebViewViewController.storyboardIdentifier) as! TicketingWebViewViewController
        let service = TicketingBookMeService(apiClient: apiClient)
        viewController.viewModel = TicketingWebViewViewModel(authentication: authentication, service: service)
        viewController.coordinator = TicketingWebViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func editPaymentRecentsViewController(navigationController: UINavigationController) -> EditPaymentRecentsViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: EditPaymentRecentsViewController.storyboardIdentifier) as! EditPaymentRecentsViewController
        
        return viewController
    }
    func editPaymentRecentNameViewController(name: String, navigationController: UINavigationController) -> EditPaymentRecentNameViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: EditPaymentRecentNameViewController.storyboardIdentifier) as! EditPaymentRecentNameViewController
        viewController.viewModel = EditPaymentRecentNameViewModel(name: name)
        
        return viewController
    }
    func paymentMenuViewController(navigationController: UINavigationController) -> PaymentMenuViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: PaymentMenuViewController.storyboardIdentifier) as! PaymentMenuViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        let zTagServices  = ZTagServices(apiClient: apiClient)
        viewController.viewModel = PaymentMenuViewModel(payment: payment, mobileNo: authentication.user.mobileNumber, zTagServices: zTagServices, authentication: self.authentication)
        viewController.coordinator = PaymentMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func paymentViewContoller(navigationController: UINavigationController) -> TransferMoneyViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: TransferMoneyViewController.storyboardIdentifier) as! TransferMoneyViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        viewController.viewModel = TransferMoneyViewModel(payment: payment, mobileNo: authentication.user.mobileNumber)
        viewController.coordinator = TransferMoneyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [
            paymentMenuViewController(navigationController: navigationController),
            paymentRecentsViewController(navigationController: navigationController)
        ]
        viewController.title = "Payments".localized
        return viewController
    }
    func otherPaymentReviewViewController(request: PaymentRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> OtherPaymentReviewViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: OtherPaymentReviewViewController.storyboardIdentifier) as! OtherPaymentReviewViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        viewController.viewModel = OtherPaymentReviewViewModel(payment: payment, request: request, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = OtherPaymentReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        
        return viewController
    }
    func otherPaymentSuccessfulViewController(receipt: PaymentReceipt, navigationController: UINavigationController, splitBillEnabled : Bool) -> OtherPaymentSuccessfulViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: OtherPaymentSuccessfulViewController.storyboardIdentifier) as! OtherPaymentSuccessfulViewController
        viewController.viewModel = OtherPaymentSuccessfulViewModel(receipt: receipt, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = OtherPaymentSuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func selectFrequencyViewController(navigationController: UINavigationController) -> SelectFrequencyViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: SelectFrequencyViewController.storyboardIdentifier) as! SelectFrequencyViewController
        
        let scheduleTransaction = ScheduleTransactionService(apiClient: apiClient)
        
        viewController.viewModel = SelectFrequencyViewModel(scheduledTransaction: scheduleTransaction, mobileNumber: authentication.user.mobileNumber)
        viewController.coordinator = SelectFrequencyCoordinator()
        
        return viewController
    }
    func newGiftRequestViewContoller(navigationController: UINavigationController,screenType: RequestGiftMoney,title: String, splitBillEnabled: Bool) -> TransferMoneyViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: TransferMoneyViewController.storyboardIdentifier) as! TransferMoneyViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        
        viewController.viewModel = TransferMoneyViewModel(payment: payment, mobileNo: authentication.user.mobileNumber)
        viewController.coordinator = TransferMoneyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [giftMoneyDetailViewController(navigationController: navigationController, screenType: screenType, splitBillEnabled: splitBillEnabled),
                                              recentsRequestMoneyViewController(navigationController: navigationController, recentScreenCase: screenType, splitBillEnabled: splitBillEnabled)]
        viewController.title = title
        return viewController
    }
    func selectRequestMoneyViewController(navigationController: UINavigationController, requestMoneyItems: GiftMoneyItemsBody, splitBillEnabled: Bool) -> SelectRequestMoneyViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: SelectRequestMoneyViewController.storyboardIdentifier) as! SelectRequestMoneyViewController
        let service = TransferMoneyService(apiClient: apiClient)
        //     viewController.viewModel = SelectGiftViewModel(giftMoneyItems: giftMoneyItems, authentication: authentication, giftMoneyService: service)
        viewController.viewModel = SelectRequestMoneyViewModel(giftMoneyItems: requestMoneyItems, authentication: authentication, giftMoneyService: service, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = SelectRequestMoneyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func searchViewController(navigationController: UINavigationController) -> SearchViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: SearchViewController.storyboardIdentifier) as! SearchViewController
        viewController.viewModel = SearchViewModel()
        viewController.coordinator = SearchCoordinator(viewController: self, navigationController: navigationController)
        viewController.title = "Search".localized
        
        return viewController
    }
    func notificationsViewController(navigationController: UINavigationController) -> NotificationsViewController {
        let notificationsService = NotificationsService(apiClient: apiClient)
        let walletStatementService = WalletStatementService(apiClient: apiClient)
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        let splitBillService = SplitBillService(apiClient: apiClient)
        
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: NotificationsViewController.storyboardIdentifier) as! NotificationsViewController
        viewController.viewModel = NotificationsViewModel(notificationService: notificationsService, walletStatementService: walletStatementService, transferMoneyService: transferMoneyService, authentication: authentication, splitBillService: splitBillService)
        viewController.coordinator = NotificationsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Notifications".localized
        
        return viewController
    }
    func convertCurrencyViewController(navigationController: UINavigationController) -> ConvertCurrencyViewController {
        let viewController = Storyboard.convertCurrency.instantiateViewController(identifier: ConvertCurrencyViewController.storyboardIdentifier) as! ConvertCurrencyViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = ConvertCurrencyViewModel(authentication: authentication, ultraService: service)
        viewController.coordinator = ConvertCurrencyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Convert Currency".localized
        
        return viewController
    }
    func convertCurrencyReviewDetailsViewController(pkrAmount: String, usdAmount: String, conversionRate: String, fee: String, mobile: String, navigationController: UINavigationController) -> ConvertCurrencyReviewDetailsViewController {
        let service = UltraService(apiClient: apiClient)
        let viewController = Storyboard.convertCurrency.instantiateViewController(identifier: ConvertCurrencyReviewDetailsViewController.storyboardIdentifier) as! ConvertCurrencyReviewDetailsViewController
        viewController.viewModel = ConvertCurrencyReviewDetailsViewModel(pkrAmount: pkrAmount, usdAmount: usdAmount, conversionRate: conversionRate, fee: fee, mobile: mobile, ultraService: service)
        viewController.coordinator = ConvertCurrencyReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        
        return viewController
    }
    func convertCurrencyProceedPaymentViewController(pkrAmount: String, usdAmount: String, conversionRate: String, fee: String, mobile: String, navigationController: UINavigationController) -> ConvertCurrencyProceedPaymentViewController {
        let viewController = Storyboard.convertCurrency.instantiateViewController(identifier: ConvertCurrencyProceedPaymentViewController.storyboardIdentifier) as! ConvertCurrencyProceedPaymentViewController
        viewController.viewModel = ConvertCurrencyProceedPaymentViewModel(pkrAmount: pkrAmount, usdAmount: usdAmount, conversionRate: conversionRate, fee: fee, mobile: mobile)
        
        return viewController
    }
    func myCardViewContoller(isFromVirtualCard: Bool, navigationController: UINavigationController, debitCardModel: DebitCardModel, tabbarController: TabBarController?) -> CardSegmentViewController {
        
        let viewController = Storyboard.card.instantiateViewController(identifier: CardSegmentViewController.storyboardIdentifier) as! CardSegmentViewController
        
        viewController.viewModel = CardSegmentViewModel(debitCardModel: debitCardModel, configrations: configurations, eventManager: eventManager, isFromVirtualCard: isFromVirtualCard)
        viewController.coordinator = CardSegmentCoordinator(navigationController: navigationController, viewControllerFactory: self, tabbarController: tabbarController)
        viewController.viewControllerItems = [
            selectDebitCardViewController(navigationController: navigationController, debitCardModel: debitCardModel, hideIntroOrderCard: false),
            virtualCardLandingViewController(navigationController: navigationController)
        ]
        viewController.title = "My Cards".localized
        return viewController
    }
    func replaceCardViewContoller(isFromVirtualCard: Bool, navigationController: UINavigationController, debitCardModel: DebitCardModel?, tabbarController: TabBarController?) -> CardSegmentViewController {
        
        let viewController = Storyboard.card.instantiateViewController(identifier: CardSegmentViewController.storyboardIdentifier) as! CardSegmentViewController
        
        viewController.viewModel = CardSegmentViewModel(debitCardModel: debitCardModel, configrations: configurations, eventManager: eventManager, isFromVirtualCard: isFromVirtualCard)
        viewController.coordinator = CardSegmentCoordinator(navigationController: navigationController, viewControllerFactory: self, tabbarController: tabbarController)
        
        viewController.viewControllerItems = [
            selectDebitCardViewController(navigationController: navigationController, debitCardModel: debitCardModel, hideIntroOrderCard: true),
            virtualCardLandingViewController(navigationController: navigationController)
        ]
        viewController.title = "My Cards".localized
        return viewController
    }
    
    func selectDebitCardViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, hideIntroOrderCard: Bool) -> SelectDebitCardViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: SelectDebitCardViewController.storyboardIdentifier) as! SelectDebitCardViewController
        viewController.viewModel = SelectDebitCardViewModel(authentication: authentication, debitCardModel: debitCardModel, hideIntroOrderCard: hideIntroOrderCard, eventManager: eventManager)
        viewController.coordinator = SelectDebitCardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "My Cards".localized
        return viewController
    }
    func debitOrderCardDetailViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?,isFromReplaceCard: Bool?, selectedCard: CardVariant? = nil) -> DebitOrderCardDetailViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: DebitOrderCardDetailViewController.storyboardIdentifier) as! DebitOrderCardDetailViewController
        let debitCardService = DebitCardService(apiClient: apiClient)
        viewController.viewModel = DebitOrderCardDetailViewModel(authentication: authentication, debitCardModel: debitCardModel, service: debitCardService, eventManager: eventManager, selectedCard: selectedCard)
        viewController.coordinator = DebitOrderCardDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        if isFromReplaceCard ?? false {
            if debitCardModel?.selectedCard?.cardName.lowercased().contains("master") ?? false {
                viewController.title = "Master Debit Card".localized
            } else if debitCardModel?.selectedCard?.cardName.lowercased().contains("smta") ?? false {
                viewController.title = "Sindh Mass Travel Master Card".localized
            } else if debitCardModel?.selectedCard?.cardName.lowercased().contains("sindh") ?? false {
                viewController.title = debitCardModel?.selectedCard?.cardName
            }
            else {
                viewController.title = "PayPak Debit Card".localized
            }
        }
        return viewController
    }
    func activeDebitCardViewController(navigationController: UINavigationController) -> ActiveDebitCardViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: ActiveDebitCardViewController.storyboardIdentifier) as! ActiveDebitCardViewController
        let service = DebitCardService(apiClient: apiClient)
        viewController.viewModel = ActiveDebitCardViewModel(service: service, accountType: authentication.account.accountLevel ?? "", cardNumber: authentication.card.cardNo ?? "", authentication: authentication)
        viewController.coordinator = ActiveDebitCardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func debitOrderCardReviewViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, fullName: String?, completeAddress: String?, streetNumber: String?, houseNumber: String?, city: City?, area: City?, selectedHeroesCard: CardVariant? = nil) -> DebitOrderCardReviewViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: DebitOrderCardReviewViewController.storyboardIdentifier) as! DebitOrderCardReviewViewController
        
        let debitCardService = DebitCardService(apiClient: apiClient)
        viewController.viewModel = DebitOrderCardReviewViewModel(authentication: authentication, service: debitCardService, debitCardModel: debitCardModel, fullName: fullName, completeAddress: completeAddress, streetNumber: streetNumber, houseNumber: houseNumber, city: city, area: area, eventManager: eventManager, selectedHeroesCard: selectedHeroesCard)
        viewController.coordinator = DebitOrderCardReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func debitOrderCardSuccessfulViewConntroller(navigationController: UINavigationController, debitCardModel: DebitCardModel?, fullName: String?, completeAddress: String?) -> DebitOrderCardSuccessfulViewConntroller {
        let viewController = Storyboard.card.instantiateViewController(identifier: DebitOrderCardSuccessfulViewConntroller.storyboardIdentifier) as! DebitOrderCardSuccessfulViewConntroller
        viewController.viewModel = DebitOrderCardSuccessfulViewModel(authentication: authentication, debitCardModel: debitCardModel, fullName: fullName, completeAddress: completeAddress)
        viewController.coordinator = DebitOrderCardSuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.cardOrderCompletion = {
            navigationController.popToRootViewController(animated: false)
            
        }
        
        return viewController
    }
    //MARK: - Virtual Cards
    
    func introDebitOrderCardViewController(cardDescriptions: [String], navigationController: UINavigationController, debitCardModel:DebitCardModel?) -> IntroDebitOrderCardViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: IntroDebitOrderCardViewController.storyboardIdentifier) as! IntroDebitOrderCardViewController
        viewController.viewModel =  IntroDebitOrderCardViewModel(authentication: authentication, debitCardModel: debitCardModel, eventManager: eventManager, cardDescriptions: cardDescriptions)
        viewController.coordinator = IntroDebitOrderCardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "My Card".localized
        return viewController
    }
    func introHeroesCardViewController(navigationController: UINavigationController, debitCardModel:DebitCardModel?) -> IntroHeroesCardViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: IntroHeroesCardViewController.storyboardIdentifier) as! IntroHeroesCardViewController
        viewController.viewModel =  IntroHeroesCardViewModel(authentication: authentication, debitCardModel: debitCardModel, eventManager: eventManager)
        viewController.coordinator = IntroHeroesCardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "My Card".localized
        return viewController
    }
    func cardControlViewController(navigationController: UINavigationController, debitCardConfiguration: DebitCardConfigurationResponse?) -> CardControlViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: CardControlViewController.storyboardIdentifier) as! CardControlViewController
        let service = DebitCardService(apiClient: apiClient)
        let ultraService = UltraService(apiClient: apiClient)
        let storage = DashboardStorage()
        viewController.viewModel = CardControlViewModel(service: service, authentication: authentication, accountType: authentication.account.accountLevel ?? "", debitCardConfiguration: debitCardConfiguration, storage: storage)
        viewController.coordinator = CardControlCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.ultraViewModel = UltraEnquiryCallViewModel(authentication: authentication, ultraService: ultraService)
        viewController.ultraCoordinator = UltraEnquiryCallViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Card Control".localized
        return viewController
        
    }
    
    func TicketBookingSuccessfulViewController(navigationController: UINavigationController,data:TicketingResponse) -> TicketingReceiptViewController {
        let viewController = Storyboard.ticketing.instantiateViewController(identifier: TicketingReceiptViewController.storyboardIdentifier) as! TicketingReceiptViewController
        viewController.viewModel = TicketingReceiptViewModel(dataRes: data, authentication: authentication)
        viewController.coordinator = TicketingReceiptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func activeCardPinViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, onDebitCardActivation: @escaping (() -> Void)) -> ActiveCardPinViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: ActiveCardPinViewController.storyboardIdentifier) as! ActiveCardPinViewController
        
        let storage = DashboardStorage()
        let debitCardService = DebitCardService(apiClient: apiClient)
        let dashboardService = DashboardService(apiClient: apiClient, storage: storage, updateCache: true)
        viewController.viewModel = ActiveCardPinViewModel(authentication: authentication, debitCardModel: debitCardModel, debitCardService: debitCardService, dashboardService: dashboardService, eventManager: eventManager)
        viewController.coordinator = ActiveCardPinCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.onDebitCardActivation = onDebitCardActivation
        //onCardActivationComoletion
        viewController.title = "Activate Card".localized
        return viewController
    }
    func trackDebitCardViewController(navigationController: UINavigationController) -> TrackDebitCardViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: TrackDebitCardViewController.storyboardIdentifier) as! TrackDebitCardViewController
        viewController.viewModel = TrackDebitCardViewModel()
        viewController.coordinator = TrackDebitCardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func cardActiveViewContoller(isFromVirtualCard: Bool, navigationController: UINavigationController, tabbarController: TabBarController?) -> CardSegmentViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: CardSegmentViewController.storyboardIdentifier) as! CardSegmentViewController
        
        viewController.viewModel = CardSegmentViewModel(debitCardModel: nil, configrations: configurations, eventManager: eventManager, isFromVirtualCard: isFromVirtualCard)
        viewController.coordinator = CardSegmentCoordinator(navigationController: navigationController, viewControllerFactory: self, tabbarController: tabbarController)
        viewController.viewControllerItems = [
            activeDebitCardViewController(navigationController: navigationController),
            virtualCardLandingViewController(navigationController: navigationController)
        ]
        viewController.title = "My Cards".localized
        return viewController
    }
    
    func debitCardStatusViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, onDebitCardActivation: @escaping (() -> Void)) -> DebitCardStatusViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: DebitCardStatusViewController.storyboardIdentifier) as! DebitCardStatusViewController
        viewController.viewModel = DebitCardStatusViewModel(authentication: authentication, debitCardModel: debitCardModel, eventManager: eventManager)
        viewController.coordinator = DebitCardStatusCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.onDebitCardActivation = onDebitCardActivation
        
        return viewController
    }
    func enterDebitCardNumberViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, onDebitCardActivation: @escaping (() -> Void) ) -> EnterDebitCardNumberViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: EnterDebitCardNumberViewController.storyboardIdentifier) as! EnterDebitCardNumberViewController
        let dashboardStorage = DashboardStorage()
        viewController.viewModel = EnterDebitCardNumberViewModel(authentication: authentication, storge: dashboardStorage, debitCardModel: debitCardModel, eventManager: eventManager)
        viewController.coordinator = EnterDebitCardNumberCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.onDebitCardActivation = onDebitCardActivation
        viewController.title = "Activate Card".localized
        return viewController
    }
    
    func debitCardOnBoardingIntroViewController(navigationController: UINavigationController, debitCardModel: DebitCardModel?, tabbarController: TabBarController?) -> CardsOnBoardingViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: CardsOnBoardingViewController.storyboardIdentifier) as! CardsOnBoardingViewController
        viewController.viewModel = CardsOnBoardingViewModel(debitCardModel: debitCardModel, eventManager: eventManager)
        viewController.coordinator = CardsOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self, tabbarController: tabbarController)
        return viewController
    }
    
    //MARK: - Zmiles
    func zMilesOnboardingStep1ViewController(navigationController: UINavigationController) -> ZMilesOnBoardingViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(withIdentifier: ZMilesOnBoardingViewController.storyboardIdentifier) as! ZMilesOnBoardingViewController
        viewController.coordinator = ZMilesOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        viewController.viewModel = ZMilesOnBoardingViewModel(authentication: authentication, service: zmilesService, zMilesEnabled: self.configurations.isZmilesRegistered)
        viewController.title = "Z Miles".localized
        return viewController
    }
    
    func zMilesDashboardViewController(navigationController: UINavigationController) -> ZMilesDashboardViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: ZMilesDashboardViewController.storyboardIdentifier) as! ZMilesDashboardViewController
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        
        viewController.viewModel = ZMilesDashboardViewModel(authentication: authentication, service: zmilesService)
        viewController.coordinator = ZMilesDashboardViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func redeemMilesViewController(navigationController: UINavigationController, showMyVouchers: Bool = false) -> RedeemMilesViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: RedeemMilesViewController.storyboardIdentifier) as! RedeemMilesViewController
        viewController.title = "Redeem Miles".localized
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        
        viewController.viewModel = RedeemMilesViewModel(authentication: authentication, service: zmilesService, showMyVouchers: showMyVouchers)
        viewController.coordinator = RedeemMilesViewCoordinator(viewControllerFactory: self, navigationController: navigationController)
        
        viewController.viewControllerItems = [
            buyVouchersViewController(navigationController: navigationController),
            myVouchersViewController(navigationController: navigationController)
        ]
        return viewController
    }
    func zMilesBenefitsViewController(navigationController: UINavigationController) -> ZMilesBenefitsViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: ZMilesBenefitsViewController.storyboardIdentifier) as! ZMilesBenefitsViewController
        viewController.title = "Benefits".localized
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        viewController.viewModel = ZMilesBenefitsViewModel(authentication: authentication, service: zmilesService)
        viewController.coordinator = ZMilesBenefitsViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func zMilesMoreInfoViewController(navigationController: UINavigationController, faqsList: [ZMilesFAQ], termsAndConditionsList: [ZMilesTermsAndCondition]) -> ZMilesMoreInfoViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: ZMilesMoreInfoViewController.storyboardIdentifier) as! ZMilesMoreInfoViewController
        
        viewController.viewModel = ZMilesMoreInfoViewModel(faqsList: faqsList, termsAndConditionsList: termsAndConditionsList)
        viewController.coordinator = ZMilesMoreInfoViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func buyVouchersViewController(navigationController: UINavigationController) -> BuyVouchersViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: BuyVouchersViewController.storyboardIdentifier) as! BuyVouchersViewController
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        viewController.viewModel = BuyVouchersViewModel(authentication: authentication, service: zmilesService)
        viewController.coordinator = BuyVouchersViewCoordinator(viewControllerFactory: self, navigationController: navigationController)
        
        return viewController
    }
    
    func buyVouchersConfirmationViewController(navigationController: UINavigationController, voucher: ZmileVouchers) -> BuyVoucherConfirmationViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: BuyVoucherConfirmationViewController.storyboardIdentifier) as! BuyVoucherConfirmationViewController
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        viewController.viewModel = BuyVoucherConfirmationViewModel(authentication: authentication, service: zmilesService, voucher: voucher)
        viewController.coordinator = BuyVoucherConfirmationViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func voucherRedepemtionSuccessViewController(navigationController: UINavigationController, miles: String, redemptionType: VoucherRedepemtionType = .Redeemed) -> VoucherRedepemtionSuccessViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: VoucherRedepemtionSuccessViewController.storyboardIdentifier) as! VoucherRedepemtionSuccessViewController
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        viewController.viewModel = VoucherRedepemtionSuccessViewModel(authentication: authentication, service: zmilesService, miles: miles, redemptionType: redemptionType)
        viewController.coordinator = VoucherRedepemtionSuccessViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func selectZmilesVoucherViewController(navigationController: UINavigationController, vouchers: [ZmileVouchers]) -> SelectZmilesVoucherViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: SelectZmilesVoucherViewController.storyboardIdentifier) as! SelectZmilesVoucherViewController
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        viewController.viewModel = SelectZmilesVoucherViewModel(authentication: authentication, service: zmilesService, zMilesVouchers: vouchers)
        viewController.coordinator = SelectZmilesVoucherViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func subscribeToZmilesViewController(navigationController: UINavigationController) -> SubscribeToZmilesViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: SubscribeToZmilesViewController.storyboardIdentifier) as! SubscribeToZmilesViewController
        viewController.viewModel = SubscribeToZmilesViewModel()
        viewController.coordinator = SubscribeToZmilesViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func myVouchersViewController(navigationController: UINavigationController) -> MyVouchersViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: MyVouchersViewController.storyboardIdentifier) as! MyVouchersViewController
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        viewController.viewModel = MyVouchersViewModel(authentication: authentication, service: zmilesService)
        viewController.coordinator = MyVouchersViewCoordinator(viewControllerFactory: self, navigationController: navigationController)
        
        return viewController
    }
    func milesCalculatorViewController(navigationController: UINavigationController) -> MilesCalculatorViewController {
        let viewController = Storyboard.zMiles.instantiateViewController(identifier: MilesCalculatorViewController.storyboardIdentifier) as! MilesCalculatorViewController
        viewController.title = "Miles Calculator".localized
        
        let zmilesService = ZMilesService(apiClient: apiClient)
        viewController.viewModel = MilesCalculatorViewModel(authentication: authentication, service: zmilesService)
        viewController.coordinator = MilesCalculatorViewCoordinator(viewControllerFactory: self, navigationController: navigationController)
        
        return viewController
    }
    func changeCardPinViewController(navigationController: UINavigationController, pinType: PinType) -> ChangeCardPinViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: ChangeCardPinViewController.storyboardIdentifier) as! ChangeCardPinViewController
        let service = DebitCardService(apiClient: apiClient)
        viewController.viewModel = ChangeCardPinViewModel(service: service, cardNumber: "", mobile: authentication.user.mobileNumber, emailPin: "0", mobilePin: authentication.security.mPin, area: "area", authentication: authentication, pinType: pinType)
        viewController.coordinator = ChangeCardPinCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    
    //MARK: - BVS & Ultra
    func biometricVerificationViewController(navigationController: UINavigationController, isAccountLogin: Bool = false, isEmailVerification: Bool = false, isFromAccountUpgrade: Bool = false, completion: @escaping (Bool) -> Void) -> BiometricVerificationViewController {
        let viewController = Storyboard.bvs.instantiateViewController(identifier: BiometricVerificationViewController.storyboardIdentifier) as! BiometricVerificationViewController
        let bvsService = BVSService(apiClient: apiClient)
        let ultraService = UltraService(apiClient: apiClient)
        viewController.viewModel = BiometricVerificationViewModel(self.authentication, bvs: bvsService, ultraService: ultraService, isAccountLogin: isAccountLogin, isEmailVerification: isEmailVerification, isFromAccountUpgrade: isFromAccountUpgrade)
        viewController.coordinator = BiometricVerificationCoodinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Biometric Verification".localized
        viewController.completion = completion
        
        return viewController
    }
    
    func verifyBiometricViewController(navigationController: UINavigationController, isAccountLogin: Bool = false, isEmailVerification: Bool = false, isVerifyAccount: Bool = false, isJsUser: Bool = false, transactionID: String = "", isFromAccountUpgrade: Bool = false, jsUpgradeAccountRequest: JsUpgradeAccountRequestModel? = nil, completion: @escaping (Bool) -> Void) -> VerifyBiometricViewController {
        let viewController = Storyboard.bvs.instantiateViewController(identifier: VerifyBiometricViewController.storyboardIdentifier) as! VerifyBiometricViewController
        //let viewController = Storyboard.ultra.instantiateViewController(identifier: VerifyBiometricViewController.storyboardIdentifier) as! VerifyBiometricViewController
        let bvsService = BVSService(apiClient: apiClient)
        let ultraService = UltraService(apiClient: apiClient)
        viewController.viewModel = BiometricVerificationViewModel(self.authentication, bvs: bvsService, ultraService: ultraService, isAccountLogin: isAccountLogin, isEmailVerification: isEmailVerification, isVerifyAccount: isVerifyAccount,  isJsUser: isJsUser, transactionID: transactionID, isFromAccountUpgrade: isFromAccountUpgrade, jsUpgradeAccountRequest: jsUpgradeAccountRequest)
        viewController.coordinator = BiometricVerificationCoodinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Biometric Verification".localized
        viewController.completion = completion
        
        return viewController
    }
    
    func bvsExemptionViewController(navigationController: UINavigationController, completion: ((Bool) -> Void)?) -> BVSExemptionViewController {
        let viewController = Storyboard.bvs.instantiateViewController(identifier: BVSExemptionViewController.storyboardIdentifier) as! BVSExemptionViewController
        let bvsService = BVSService(apiClient: apiClient)
        viewController.viewModel = BVSExemptionViewModel(authentication: authentication, bvsService: bvsService)
        viewController.coordinator = BVSExemptionCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Biometric Exemption".localized
        viewController.completion = completion
        
        return viewController
    }
    
    func ultraViewController(ultraInquiryResponse: [UltraAccountInquiryBody], ultraAccountStateModel: UltraSaveAccountStateModel?, navigationController: UINavigationController) -> UltraStartJourneyViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraStartJourneyViewController.storyboardIdentifier) as! UltraStartJourneyViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = UltraStartJourneyViewModel(ultraInquiryResponse: ultraInquiryResponse, authentication: authentication, ultraAccountStateModel: ultraAccountStateModel, service: service)
        viewController.coordinator = UltraStartJourneyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func ultraBasicInfoViewController(acccountType: UltraAccountType, ultraAccountInquiryDetails: [UltraAccountInquiryDetails], ultraAccountStateModel: UltraSaveAccountStateModel?, accountLevel: String, navigationController: UINavigationController, pageTitle: String) -> UltraBasicInfoViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraBasicInfoViewController.storyboardIdentifier) as! UltraBasicInfoViewController
        let service = UltraService(apiClient: apiClient)
        viewController.accountType = acccountType
        viewController.viewModel = UltraBasicInfoViewModel(ultraAccountInquiryDetails: ultraAccountInquiryDetails, service: service, accountLevel: accountLevel, ultraAccountStateModel: ultraAccountStateModel, pageTitle: pageTitle)
        viewController.coordinator = UltraBasicInfoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func ultraEmailViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel?, navigationController: UINavigationController) -> UltraEmailViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraEmailViewController.storyboardIdentifier) as! UltraEmailViewController
        viewController.viewModel = UltraEmailViewModel(authentication: authentication, ultraFieldsResponse: ultraFieldsResponse, ultraAccountStateModel: ultraAccountStateModel)
        viewController.coordinator = UltraEmailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func ultraIdentityViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel?, navigationController: UINavigationController, resumePageNo: String = "", isFromDescript: Bool = false, isFromUltraBasicAccount: Bool = false) -> UltraIdentityViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraIdentityViewController.storyboardIdentifier) as! UltraIdentityViewController
        let service = UltraService(apiClient: apiClient)
        let ultraService = UltraService(apiClient: apiClient)
        viewController.viewModel = UltraIdentityViewModel(ultraFieldsResponse: ultraFieldsResponse, service: service, ultraAccountStateModel: ultraAccountStateModel, authentication: authentication, resumePageNo: resumePageNo, isFromDescript: isFromDescript, isFromUltraBasicAccount: isFromUltraBasicAccount)
        viewController.ultraViewModel = UltraEnquiryCallViewModel(authentication: authentication, ultraService: ultraService)
        viewController.coordinator = UltraIdentityCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.ultraCoordinator = UltraEnquiryCallViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func ultraDualCitizenViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel,  navigationController: UINavigationController, resumePageNo: String = "", isFromDescript: Bool = false, isFromUltraBasicAccount: Bool = false) -> UltraDualCitizenViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraDualCitizenViewController.storyboardIdentifier) as! UltraDualCitizenViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = UltraDualCitizenViewModel(ultraFieldsResponse: ultraFieldsResponse, service: service, ultraAccountStateModel: ultraAccountStateModel, resumePageNo: resumePageNo)
        viewController.coordinator = UltraDualCitizenCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func usAddressViewController(title: String?, list: [String]) -> USAddressViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: USAddressViewController.storyboardIdentifier) as! USAddressViewController
        viewController.titleText = title
        viewController.isUSCitizen = list
        
        return viewController
    }
    
    func personalIncomeViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel,  navigationController: UINavigationController, resumePageNo: String = "", isFromDescript: Bool = false, isFromUltraBasicAccount: Bool = false) -> UltraPersonalIncomeViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraPersonalIncomeViewController.storyboardIdentifier) as! UltraPersonalIncomeViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = UltraPersonalIncomeViewModel(ultraFieldsResponse: ultraFieldsResponse, service: service, ultraAccountStateModel: ultraAccountStateModel, resumePageNo: resumePageNo, isFromDescript: isFromDescript, isFromUltraBasicAccount: isFromUltraBasicAccount, authentication: authentication)
        viewController.coordinator = UltraPersonalIncomeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func ultraMailingAddressViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel, navigationController: UINavigationController, resumePageNo: String = "", isFromDescript: Bool = false, isFromUltraBasicAccount: Bool = false) -> UltraMailingAddressViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraMailingAddressViewController.storyboardIdentifier) as! UltraMailingAddressViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = UltraMailingAddressViewModel(ultraFieldsResponse: ultraFieldsResponse, service: service, ultraAccountStateModel: ultraAccountStateModel, resumePageNo: resumePageNo, isFromDescript: isFromDescript, isFromUltraBasicAccount: isFromUltraBasicAccount, authentication: authentication)
        viewController.coordinator = UltraMailingAddressCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func ultraQuestionsViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel, navigationController: UINavigationController, isFromDescript: Bool = false, isFromUltraBasicAccount: Bool = false) -> UltraQuestionsViewController {
        let service = UltraService(apiClient: apiClient)
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraQuestionsViewController.storyboardIdentifier) as! UltraQuestionsViewController
        viewController.viewModel = UltraQuestionsViewModel(ultraFieldsResponse: ultraFieldsResponse, service: service, ultraAccountStateModel: ultraAccountStateModel, isFromDescript: isFromDescript, isFromUltraBasicAccount: isFromUltraBasicAccount, authentication: authentication)
        viewController.coordinator = UltraQuestionsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func ultraDropdownViewController(dropdownList: [String], navigationController: UINavigationController) -> UltraDropdownViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraDropdownViewController.storyboardIdentifier) as! UltraDropdownViewController
        viewController.viewModel = UltraDropdownViewModel(dropdownList: dropdownList)
        
        return viewController
    }
    
    func ultraMobileViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel,  navigationController: UINavigationController, resumePageNo: String, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraMobileViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraMobileViewController.storyboardIdentifier) as! UltraMobileViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = UltraMobileViewModel(ultraFieldsResponse: ultraFieldsResponse, service: service, ultraAccountStateModel: ultraAccountStateModel, resumePageNo: resumePageNo, isFromDescript: isFromDescript, isFromUltraBasicAccount: isFromUltraBasicAccount, authentication: authentication)
        viewController.coordinator = UltraMobileCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func ultraVideoViewController(ultraFieldsResponse: [UltraFieldsResponse], ultraAccountStateModel: UltraSaveAccountStateModel?, navigationController: UINavigationController, resumePageNo: String, isFromDescript: Bool, isFromUltraBasicAccount: Bool) -> UltraVideoViewController {
        let viewController = Storyboard.ultra.instantiateViewController(identifier: UltraVideoViewController.storyboardIdentifier) as! UltraVideoViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = UltraVideoViewModel(ultraFieldsResponse: ultraFieldsResponse, service: service, ultraAccountStateModel: ultraAccountStateModel, resumePageNo: resumePageNo, isFromDescript: isFromDescript, isFromUltraBasicAccount: isFromUltraBasicAccount, authentication: authentication)
        viewController.coordinator = UltraVideoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    //MARK: - Trasaction History
    func transactionHistoryViewController(navigationController: UINavigationController, segmentType: String, initialIndex: Int, todayHistory: Bool) -> TransactionHistoryViewController {
        let viewController = Storyboard.transaction.instantiateViewController(identifier: TransactionHistoryViewController.storyboardIdentifier) as! TransactionHistoryViewController
        
        let service = WalletStatementService(apiClient: apiClient)
        viewController.viewModel = TransactionHistoryViewModel(authentication, service: service, mobileNumber: authentication.user.mobileNumber, segmentType: segmentType, initialIndex: initialIndex, todayHistory: todayHistory)
        viewController.coordinator = TransactionHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.segmentsArray = ["All".localized, "Received".localized, "Sent".localized]
        viewController.title = "History".localized
        return viewController
    }
    
    func cashFlowsViewController(navigationController: UINavigationController,initialIndex: Int) -> TransactionHistoryViewController {
        let viewController = Storyboard.transaction.instantiateViewController(identifier: TransactionHistoryViewController.storyboardIdentifier) as! TransactionHistoryViewController
        
        let service = WalletStatementService(apiClient: apiClient)
        viewController.viewModel = TransactionHistoryViewModel(authentication, service: service, mobileNumber: authentication.user.mobileNumber, segmentType: "All", initialIndex: initialIndex, todayHistory: false)
        viewController.coordinator = TransactionHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.segmentsArray = ["All".localized, "Received".localized, "Sent".localized]
        viewController.isHistory = false
        return viewController
    }
    
    // MARK: - QR Scan
    func becomeMerchantOnboardingViewController(model: MerchantOnboardingResponse, navigationController: UINavigationController) -> BecomeMerchantOnboardingViewController {
        let viewController = Storyboard.becomeMerchant.instantiateViewController(identifier: BecomeMerchantOnboardingViewController.storyboardIdentifier) as! BecomeMerchantOnboardingViewController
        viewController.viewModel = BecomeMerchantOnboardingViewModel(eventManager: self.eventManager, model: model)
        let formattedText = "\u{200E} بنیں Merchant"
        viewController.title = Language.current == .english ? "Become A Merchant" : formattedText
        viewController.coordinator = BecomeMerchantOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func becomeMerchantPersonalViewController(model: MerchantOnboardingResponse, navigationController: UINavigationController) -> BecomeMerchantPersonalViewController {
        let viewController = Storyboard.becomeMerchant.instantiateViewController(withIdentifier: BecomeMerchantPersonalViewController.storyboardIdentifier) as! BecomeMerchantPersonalViewController
        viewController.coordinator = BecomeMerchantOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewModel = BecomeMerchantPersonalViewModel(model: model, authentication: authentication, eventManager: self.eventManager)
        let formattedText = "\u{200E} بنیں Merchant"
        viewController.title = Language.current == .english ? "Become A Merchant" : formattedText
        return viewController
    }
    
    func becomeMerchantBusinessViewController(model: MerchantOnboardingResponse, personalInfo: MerchantPersonalInfo, navigationController: UINavigationController) -> BecomeMerchantBusinessViewController {
        let viewController = Storyboard.becomeMerchant.instantiateViewController(withIdentifier: BecomeMerchantBusinessViewController.storyboardIdentifier) as! BecomeMerchantBusinessViewController
        viewController.coordinator = BecomeMerchantOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewModel = BecomeMerchantBusinessViewModel(model: model, personalInfo: personalInfo, qrService: QRService(apiClient: apiClient), authentication: authentication, eventManager: self.eventManager)
        viewController.title = "Become A Merchant".localized
        return viewController
    }
    
    func merchantAttachmentInfoViewController() -> MerchantAttachmentInfoViewController {
        let viewController = Storyboard.becomeMerchant.instantiateViewController(withIdentifier: MerchantAttachmentInfoViewController.storyboardIdentifier) as! MerchantAttachmentInfoViewController
        return viewController
    }
    
    func becomeMerchantSuccesViewController(model: BecomeMerchantSuccessModel, type: QRSuccessType, title: String, navigationController: UINavigationController) -> BecomeMerchantSuccesViewController {
        let viewController = Storyboard.becomeMerchant.instantiateViewController(withIdentifier: BecomeMerchantSuccesViewController.storyboardIdentifier) as! BecomeMerchantSuccesViewController
        viewController.coordinator = BecomeMerchantOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewModel = BecomeMerchantSuccessViewModel(model: model, type: type, eventManager: self.eventManager)
        viewController.title = title
        return viewController
    }
    
    func merchantDiscrepancyViewController(model: MerchantOnboardingResponse, navigationController: UINavigationController) -> MerchantDiscrepancyViewController {
        let viewController = Storyboard.becomeMerchant.instantiateViewController(withIdentifier: MerchantDiscrepancyViewController.storyboardIdentifier) as! MerchantDiscrepancyViewController
        let qrService = QRService(apiClient: apiClient)
        viewController.viewModel = MerchantDiscrepancyViewModel(model: model, qrService: qrService, authentication: authentication)
        viewController.coordinator = MerchantDiscrepancyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func qrContainerViewController(navigationController: UINavigationController) -> QRContainerViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(identifier: QRContainerViewController.storyboardIdentifier) as! QRContainerViewController
        //        viewController.tabBarItem = UITabBarItem(title: "Scan QR", image: UIImage(named: "qrIcon")!, tag: 1)
        viewController.coordinator = QRScanContainerCoordinator(viewControllerFactory: self, navigationController: navigationController)
        
        var viewControllerItems: [UIViewController] = [
            qrPayViewController(navigationController: navigationController),
            qrReceiveViewController(navigationController: navigationController)
        ]
        
        if authentication.account.merchantStatus?.lowercased() == "a" {
            viewControllerItems.append(qrMerchantRequestViewController(navigationController: navigationController))
        } else {
            viewControllerItems.append(qrCustomerReqeustViewController(navigationController: navigationController))
        }
        
        viewController.viewControllerItems = viewControllerItems
        viewController.title = " "
        return viewController
    }
    
    func qrCustomerReqeustViewController(navigationController: UINavigationController) -> QRRequestsViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(identifier: QRRequestsViewController.storyboardIdentifier) as! QRRequestsViewController
        viewController.coordinator = QRRequestsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.viewModel = QRRequestsViewModel(authentication: authentication, qrService: QRService(apiClient: apiClient))
        return viewController
    }
    
    func qrReceiveViewController(navigationController: UINavigationController) -> QRReceiveViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(identifier: QRReceiveViewController.storyboardIdentifier) as! QRReceiveViewController
        viewController.coordinator = QRRecieveCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.viewModel = QRRecieveViewModel(authentication: authentication, qrService: QRService(apiClient: apiClient))
        return viewController
    }
    
    func qrPayViewController(navigationController: UINavigationController) -> QRPayViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(identifier: QRPayViewController.storyboardIdentifier) as! QRPayViewController
        viewController.coordinator = QRPayCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.viewModel = QRPayViewModel()
        return viewController
    }
    
    func qrPayScanViewController(navigationController: UINavigationController, onScan: @escaping (DecodedQR) -> Void) -> QRPayScanViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRPayScanViewController.storyboardIdentifier) as! QRPayScanViewController
        viewController.onScan = onScan
        viewController.viewModel = QRPayScanViewModel(authentication: authentication)
        viewController.coordinator = QRPayScanCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func qrPayFormViewController(decodedQR: DecodedQR, onTapEditAmount: (() -> Void)? = nil, navigationController: UINavigationController) -> QRPayFormViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRPayFormViewController.storyboardIdentifier) as! QRPayFormViewController
        viewController.viewModel = QRPayFormViewModel(
            decodedQR: decodedQR,
            qrService: QRService(apiClient: apiClient),
            authentication: authentication
        )
        viewController.coordinator = QRPayFormCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.onTapEditAmount = onTapEditAmount
        return viewController
    }
    
    func qrPayReviewViewController(navigationController: UINavigationController, model: QRPayReviewModel, type: QRPayReviewType, isDynamicQR: Bool, onTapEditAmount: (() -> Void)? = nil) -> QRPayReviewViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRPayReviewViewController.storyboardIdentifier) as! QRPayReviewViewController
        viewController.coordinator = QRPayReviewCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.viewModel = QRPayReviewViewModel(
            qrService: QRService(apiClient: apiClient),
            authentication: authentication,
            model: model,
            type: type,
            isDynamicQR: isDynamicQR
        )
        viewController.onTapEditAmount = onTapEditAmount
        return viewController
    }
    
    func qrPayPreviewDetailsViewController(navigationController: UINavigationController, merchantDetails: [MerchantDetails]) -> QRPayPreviewDetailsViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRPayPreviewDetailsViewController.storyboardIdentifier) as! QRPayPreviewDetailsViewController
        viewController.coordinator = QRPayPreviewDetailsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.viewModel = QRPayPreviewDetailsViewModel(merchantDetails: merchantDetails)
        return viewController
    }
    
    func qrTillPaymentViewController(navigationController: UINavigationController) -> QRTillPaymentViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRTillPaymentViewController.storyboardIdentifier) as! QRTillPaymentViewController
        viewController.viewModel = QRTillPaymentViewModel(qrService: QRService(apiClient: apiClient), authentication: authentication)
        viewController.coordinator = QRTillPaymentCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func qrMorePaymentsViewController(navigationController: UINavigationController) -> QRMorePaymentsViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRMorePaymentsViewController.storyboardIdentifier) as! QRMorePaymentsViewController
        viewController.viewModel = QRMorePaymentsViewModel(qrService: QRService(apiClient: apiClient), authentication: authentication)
        viewController.coordinator = QRMorePaymentsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func qrMerchantRequestViewController(navigationController: UINavigationController) -> QRMerchantRequestViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRMerchantRequestViewController.storyboardIdentifier) as! QRMerchantRequestViewController
        viewController.viewModel = QRMerchantRequestViewModel(authentication: authentication, qrService: QRService(apiClient: apiClient))
        viewController.coordinator = QRMerchantRequestCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func qrMerchantNewPaymentRequestViewController(navigationController: UINavigationController) -> QRMNewPaymentRequestViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRMNewPaymentRequestViewController.storyboardIdentifier) as! QRMNewPaymentRequestViewController
        viewController.viewModel = QRMNewPaymentRequestViewModel(
            qrService: QRService(apiClient: apiClient),
            authentication: authentication
        )
        viewController.coordinator = QRMNewPaymentRequestCoordinator (viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func qrMerchantReceivedRequestsViewController(navigationController: UINavigationController) -> QRMReceivedRequestsViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRMReceivedRequestsViewController.storyboardIdentifier) as! QRMReceivedRequestsViewController
        viewController.viewModel = QRMReceivedRequestsViewModel(authentication: authentication, qrService: QRService(apiClient: apiClient))
        viewController.coordinator = QRMReceivedRequestsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func qrMerchantManageInvoicesViewController(navigationController: UINavigationController) -> QRMManageInvoicesViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(withIdentifier: QRMManageInvoicesViewController.storyboardIdentifier) as! QRMManageInvoicesViewController
        viewController.viewModel = QRMManagerInvoicesViewModel(authentication: authentication, qrService: QRService(apiClient: apiClient))
        viewController.coordinator = QRMManageInvoicesCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func selectItemViewController(navigationController: UINavigationController, title: String, selectionData: [String], onSelect: @escaping (String) -> Void) -> SelectItemViewController {
        let viewController = Storyboard.becomeMerchant.instantiateViewController(identifier: SelectItemViewController.storyboardIdentifier) as! SelectItemViewController
        viewController.didTapClose = {
            viewController.dismiss(animated: true)
        }
        viewController.onNext = onSelect
        viewController.sheetTitle = title
        viewController.selectionData = selectionData
        return viewController
    }
    
    func qrPayDetailsViewController(navigationController: UINavigationController, model: QRPayReviewModel, transactionDate: String, transactionTime: String, transactionId: String) -> QRPayDetailsViewController {
        let viewController = Storyboard.qrScan.instantiateViewController(identifier: QRPayDetailsViewController.storyboardIdentifier) as! QRPayDetailsViewController
        viewController.viewModel = QRPayDetailsViewModel(
            model: model,
            transactionDate: transactionDate,
            transactionTime: transactionTime,
            transactionId: transactionId
        )
        viewController.coordinator = QRPayDetailsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    // MARK: - MutualFunds
    
    func mFundsOnboardingViewController(navigationController: UINavigationController) -> MutualFundsOnboardingController {
        let viewController = Storyboard.mutualFundsOnboarding.instantiateViewController(withIdentifier: MutualFundsOnboardingController.storyboardIdentifier) as! MutualFundsOnboardingController
        viewController.coordinator = MutualFundsOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewModel = MutualFundsOnboardingViewModel()
        viewController.eventManager = self.eventManager
        viewController.title = "Mutual Funds".localized
        return viewController
    }
    
    //    func mFundsHowItWorksViewController(navigationController: UINavigationController) -> HowIsWorkViewController {
    //        let viewController = Storyboard.mutualFundsOnboarding.instantiateViewController(withIdentifier: HowIsWorkViewController.storyboardIdentifier) as! HowIsWorkViewController
    //        viewController.coordinator = MutualFundsOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
    //        viewController.viewModel = HowIsWorkViewModel()
    //        viewController.title = "Mutual Funds"
    //        return viewController
    //    }
    
    func mFundsAccountRegistrationViewController(navigationController: UINavigationController) -> MFundsAccountRegistrationViewController {
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MFundsAccountRegistrationViewController.storyboardIdentifier) as! MFundsAccountRegistrationViewController
        viewController.title = "Account Registration".localized
        viewController.viewModel = MFundsAccountRegistrationViewModel(authenticationService: authentication, mutualFundsService: mutualFundsService, eventManager: self.eventManager)
        viewController.coordinator = MFundsAccountRegistrationCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func mFundsAccountVerificationViewController(cnic: String, cnicIssueDate: String, cnicExpiryDate: String, email: String, mobile: String, msgID: String, navigationController: UINavigationController) -> MFundsAccountVerificationViewController {
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MFundsAccountVerificationViewController.storyboardIdentifier) as! MFundsAccountVerificationViewController
        viewController.title = "Account Registration".localized
        viewController.viewModel = MFundsAccountVerificationViewModel(authenticationService: authentication, mutualFundsService: mutualFundsService, cnic: cnic, cnicIssueDate: cnicIssueDate, cnicExpiryDate: cnicExpiryDate, email: email, mobile: mobile, msgID : msgID, eventManager: self.eventManager)
        viewController.coordinator = MFundsAccountVerificationCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func mFundsAccountRegistrationStepThreeViewController(navigationController: UINavigationController, registrationData: MutualFundsRegistrationData) -> MFundsAccountRegistrationStepThreeViewController {
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MFundsAccountRegistrationStepThreeViewController.storyboardIdentifier) as! MFundsAccountRegistrationStepThreeViewController
        viewController.title = "Account Registration".localized
        viewController.viewModel = MFundsAccountRegistrationStepThreeViewModel(authenticationService: authentication, mutualFundsService: mutualFundsService, registrationData: registrationData, eventManager: self.eventManager)
        viewController.coordinator = MFundsAccountRegistrationStepThreeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func mFundsAccountRegistrationStepFinalViewController(navigationController: UINavigationController, registrationData: MutualFundsRegistrationData, asanAccountCombos: LoadAsanAccountComboResponse?) -> MFundsAccountRegistrationStepFinalViewController {
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MFundsAccountRegistrationStepFinalViewController.storyboardIdentifier) as! MFundsAccountRegistrationStepFinalViewController
        viewController.title = "Account Registration".localized
        viewController.viewModel = MFundsAccountRegistrationStepFinalViewModel(authenticationService: authentication, mutualFundsService: mutualFundsService, registrationData: registrationData, asanAccountCombos: asanAccountCombos, eventManager: self.eventManager)
        viewController.coordinator = MFundsAccountRegistrationStepFinalCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func mFundsVerificationAlertViewController(navigationController: UINavigationController, completion: @escaping () -> Void) -> MFundsVerificationAlertViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MFundsVerificationAlertViewController.storyboardIdentifier) as! MFundsVerificationAlertViewController
        viewController.viewModel = MFundsVerificationAlertViewModel(completion: completion)
        viewController.coordinator = MFundsVerificationAlertCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func fundsHomeViewController(mutualFundsResponse: (MFundsAccountDetailsResponse?, String), navigationController: UINavigationController) -> FundsHomeViewController {
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: FundsHomeViewController.storyboardIdentifier) as! FundsHomeViewController
        viewController.title = "Mutual Funds".localized
        viewController.viewModel = FundsHomeViewModel(authentication, mutualFundsService, mutualFundsResponse: mutualFundsResponse)
        viewController.coordinator = FundsHomeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func myFundsPortfoliaViewController(folioNumber: String, navigationController: UINavigationController) -> MyFundsPortfoliaViewController {
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MyFundsPortfoliaViewController.storyboardIdentifier) as! MyFundsPortfoliaViewController
        viewController.title = "My Portfolio".localized
        viewController.viewControllerItems = [
            myFundsViewController(navigationController: navigationController),
            myFundsTransViewController(folioNumber: folioNumber, navigationController: navigationController),
            myFundsStatementViewController(navigationController: navigationController)
        ]
        viewController.viewModel = MyFundsPortfolioViewModel(authentication, mutualFundsService, folioNumber: folioNumber)
        viewController.coordinator = MyFundsPortfolioCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func myFundsViewController(navigationController: UINavigationController) -> MyFundsViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MyFundsViewController.storyboardIdentifier) as! MyFundsViewController
        viewController.title = "Allocations".localized
        viewController.viewModel = MyFundsViewModel()
        viewController.coordinator = MyFundsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func myFundsTransViewController(folioNumber: String, navigationController: UINavigationController) -> MyFundsTransViewController {
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MyFundsTransViewController.storyboardIdentifier) as! MyFundsTransViewController
        viewController.title = "Transactions".localized
        viewController.viewModel = MyFundsTransViewModel(authentication, mutualFundsService, folioNumber: folioNumber)
        viewController.coordinator = MyFundsTransCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func myFundsStatementViewController(navigationController: UINavigationController) -> MyFundsStatementViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: MyFundsStatementViewController.storyboardIdentifier) as! MyFundsStatementViewController
        viewController.title = "Statement".localized
        viewController.viewModel = MyFundsStatementViewModel()
        viewController.coordinator = MyFundsStatementCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func fundsDetailsViewController(mutualFund: MutualFund?, investedFund: MyFund?, accountDetail: MFundsAccountDetailsResponse?, navigationController: UINavigationController) -> FundsDetailsViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: FundsDetailsViewController.storyboardIdentifier) as! FundsDetailsViewController
        viewController.title = mutualFund?.title.capitalized
        //"JS Cash Fund"
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        //TODO: need to pass investedFund object
        viewController.viewModel = FundsDetailsViewModel(authenticationService: authentication, mutualFundsService: mutualFundsService, mutualFund: mutualFund, investedFund: investedFund, accountDetail: accountDetail)
        viewController.coordinator = FundsDetailsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func investFundContainerViewController(navigationController: UINavigationController) -> InvestFundContainerViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: InvestFundContainerViewController.storyboardIdentifier) as! InvestFundContainerViewController
        viewController.title = "Mutual Funds".localized
        viewController.viewModel = InvestFundContainerViewModel()
        viewController.coordinator = InvestFundContainerCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.viewControllerItems = [
            investFundViewController(fundName: "", unitPrice: "", fundCode: "", fundShortName: "", folioNumber: "", userId: "", bankAccount: "", salesLoad: "", navigationController: navigationController),
            convertFundViewController(navigationController: navigationController)
        ]
        return viewController
    }
    
    func cashOutFundViewController(fundName: String, unitPrice: String, fundCode: String, fundShortName: String, folioNumber: String, userId: String, bankAccount: String, salesLoad: String, balanceAmount: String, balanceUnits: String, navigationController: UINavigationController) -> CashOutFundViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: CashOutFundViewController.storyboardIdentifier) as! CashOutFundViewController
        
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        viewController.viewModel = CashOutFundViewModel(authentication, mutualFundsService, fundName: fundName, unitPrice: unitPrice, fundCode: fundCode, fundShortName: fundShortName, folioNumber: folioNumber, userId: userId, bankAccount: bankAccount, salesLoad: salesLoad, balanceAmount: balanceAmount, balanceUnits: balanceUnits)
        viewController.coordinator = CashOutFundCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Cash-Out Funds".localized
        return viewController
    }
    
    func cashOutFundReviewDetailsViewController(amount: String, fee: String, folioNumber: String, receiverName: String, fundName: String, fundCode: String, unitPrice: String, receiverMobile: String, saleLoad: String, userId: String, purchasedUnitDisplay : String, navigationController: UINavigationController) -> CashOutFundReviewDetailsViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: CashOutFundReviewDetailsViewController.storyboardIdentifier) as! CashOutFundReviewDetailsViewController
        
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        viewController.viewModel = CashOutFundReviewDetailsViewModel(authentication: authentication, mutualFundsService: mutualFundsService, amount: amount, folioNumber: folioNumber, fee: fee, receiverName: receiverName, fundName: fundName, fundCode: fundCode, unitPrice: unitPrice, receiverMobile: receiverMobile, saleLoad: saleLoad, userId: userId, purchasedUnitDisplay : purchasedUnitDisplay)
        viewController.coordinator = CashOutFundReviewDetailsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Review Details".localized
        return viewController
    }
    func cashOutFundReceiptViewController(amount: String, fee: String, receiverName: String, fundName: String, unitPrice: String, receiverMobile: String, purchasedUnitDisplay : String, navigationController: UINavigationController, completion: @escaping (() -> ())) -> CashOutFundReceiptViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: CashOutFundReceiptViewController.storyboardIdentifier) as! CashOutFundReceiptViewController
        viewController.viewModel = CashOutFundReceiptViewModel(authenticaiton: authentication, amount: amount, fee: fee, receiverName: receiverName, fundName: fundName, unitPrice: unitPrice, receiverMobile: receiverMobile, purchasedUnitDisplay : purchasedUnitDisplay)
        viewController.coordinator = CashOutFundReceiptCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.didTapToClose = completion
        return viewController
    }
    
    func investFundViewController(fundName: String, unitPrice: String, fundCode: String, fundShortName: String, folioNumber: String, userId: String, bankAccount: String, salesLoad: String, navigationController: UINavigationController) -> InvestFundViewController {
        
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: InvestFundViewController.storyboardIdentifier) as! InvestFundViewController
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        viewController.viewModel = InvestFundViewModel(authentication, mutualFundsService, fundName: fundName, unitPrice: unitPrice, fundCode: fundCode, fundShortName: fundShortName, folioNumber: folioNumber, userId: userId, bankAccount: bankAccount, salesLoad: salesLoad)
        viewController.title = "Investment in".localized
        viewController.coordinator = InvestFundCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func investFundReviewDetailsViewController(amount: String, fee: String, receiverName: String, fundName: String, fundCode: String, unitPrice: String, senderName: String, accountNumber: String, folioNumber: String, userId: String, productId: String, saleLoad: String, navigationController: UINavigationController) -> InvestFundReviewDetailsViewController {
        
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: InvestFundReviewDetailsViewController.storyboardIdentifier) as! InvestFundReviewDetailsViewController
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        viewController.viewModel = InvestFundReviewDetailsViewModel(authentication, mutualFundsService, amount: amount, fee: fee, receiverName: receiverName, fundName: fundName, fundCode: fundCode, unitPrice: unitPrice, senderName: senderName, accountNumber: accountNumber, folioNumber: folioNumber, userId: userId, productId: productId, saleLoad: saleLoad)
        viewController.coordinator = InvestFundReviewDetailsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Review Details".localized
        return viewController
    }
    
    func investFundReceiptViewController(amount: String, fee: String, receiverName: String, fundName: String, unitPrice: String, senderName: String, purchasedUnitDisplay : String, navigationController: UINavigationController, completion: @escaping (() -> ())) -> InvestFundReceiptViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: InvestFundReceiptViewController.storyboardIdentifier) as! InvestFundReceiptViewController
        viewController.viewModel = InvestFundReceiptViewModel(authentication: authentication, amount: amount, fee: fee, receiverName: receiverName, fundName: fundName, unitPrice: unitPrice, senderName: senderName,purchasedUnitDisplay : purchasedUnitDisplay)
        viewController.coordinator = InvestFundReceiptCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.didTapClose = completion
        return viewController
    }
    
    func convertFundViewController(navigationController: UINavigationController) -> ConvertFundViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: ConvertFundViewController.storyboardIdentifier) as! ConvertFundViewController
        viewController.viewModel = ConvertFundViewModel()
        viewController.coordinator = ConvertFundCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func convertFundReceiptViewController(navigationController: UINavigationController) -> ConvertFundReceiptViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: ConvertFundReceiptViewController.storyboardIdentifier) as! ConvertFundReceiptViewController
        viewController.viewModel = ConvertFundReceiptViewModel()
        viewController.coordinator = ConvertFundReceiptCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func selectFundViewController(navigationController: UINavigationController) -> SelectFundViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: SelectFundViewController.storyboardIdentifier) as! SelectFundViewController
        viewController.viewModel = SelectFundViewModel()
        viewController.coordinator = SelectFundCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func convertFundReviewDetailsViewController(navigationController: UINavigationController) -> ConvertFundReviewDetailsViewController {
        let viewController = Storyboard.mutualFunds.instantiateViewController(identifier: ConvertFundReviewDetailsViewController.storyboardIdentifier) as! ConvertFundReviewDetailsViewController
        viewController.viewModel = ConvertFundReviewDetailsViewModel()
        viewController.coordinator = ConvertFundReviewDetailsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Review Details".localized
        return viewController
    }
    
    func upgradePersonalInfoViewController(navigationController: UINavigationController) -> UpgradePersonalInfoViewController {
        let viewController = Storyboard.upgradeFunds.instantiateViewController(identifier: UpgradePersonalInfoViewController.storyboardIdentifier) as! UpgradePersonalInfoViewController
        viewController.title = "Upgrade".localized
        viewController.coordinator = UpgradePersonalInfoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func upgradeContactInfoViewController(navigationController: UINavigationController) -> UpgradeContactInfoViewController {
        let viewController = Storyboard.upgradeFunds.instantiateViewController(identifier: UpgradeContactInfoViewController.storyboardIdentifier) as! UpgradeContactInfoViewController
        viewController.title = "Upgrade".localized
        viewController.coordinator = UpgradeContactInfoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func upgradeNextOfKinInfoViewController(navigationController: UINavigationController) -> UpgradeNextOfKinInfoViewController {
        let viewController = Storyboard.upgradeFunds.instantiateViewController(identifier: UpgradeNextOfKinInfoViewController.storyboardIdentifier) as! UpgradeNextOfKinInfoViewController
        viewController.title = "Upgrade".localized
        viewController.coordinator = UpgradeNextOfKinInfoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func upgradeOtherInformationViewController(navigationController: UINavigationController) -> UpgradeOtherInfoViewController {
        let viewController = Storyboard.upgradeFunds.instantiateViewController(identifier: UpgradeOtherInfoViewController.storyboardIdentifier) as! UpgradeOtherInfoViewController
        viewController.title = "Upgrade".localized
        viewController.coordinator = UpgradeOtherInfoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func upgradePowerOfAttorneyInfoViewController(navigationController: UINavigationController) -> UpgradePowerOfAttorneyInfoViewController {
        let viewController = Storyboard.upgradeFunds.instantiateViewController(identifier: UpgradePowerOfAttorneyInfoViewController.storyboardIdentifier) as! UpgradePowerOfAttorneyInfoViewController
        viewController.title = "Upgrade".localized
        viewController.coordinator = UpgradePowerOfAttorneyInfoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func upgradeInvestmentInformationViewController(navigationController: UINavigationController) -> UpgradeInvestmentInfoViewController {
        let viewController = Storyboard.upgradeFunds.instantiateViewController(identifier: UpgradeInvestmentInfoViewController.storyboardIdentifier) as! UpgradeInvestmentInfoViewController
        viewController.title = "Upgrade".localized
        viewController.coordinator = UpgradeInvestmentInfoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    // MARK: - Invite And Earn
    
    func inviteAndEarnViewController(navigationController: UINavigationController) -> InviteAndEarnViewController {
        let viewController = Storyboard.InviteEarn.instantiateViewController(withIdentifier: InviteAndEarnViewController.storyboardIdentifier) as! InviteAndEarnViewController
        let inviteAndEarnService = InviteAndEarnService(apiClient: apiClient)
        viewController.viewModel = InviteAndEarnViewModel(authentication: authentication, invitAndEarnService: inviteAndEarnService, configurations: self.configurations)
        viewController.coordinator = InviteAndEarnCoordinator(navigationCotroller: navigationController, viewControllerFactory: self)
        viewController.title = "Invite & Earn".localized
        return viewController
    }
    func howItsWorkViewController(isDebitReferral: Bool) -> HowInviteEarnWorksViewController{
        let viewController = Storyboard.InviteEarn.instantiateViewController(identifier: HowInviteEarnWorksViewController.storyboardIdentifier) as! HowInviteEarnWorksViewController
        viewController.viewModel = HowInviteEarnWorksViewModel(isDebitReferral: isDebitReferral)
        return viewController
    }
    func inviteContactsViewController(isDebitReferral: Bool, navigationController: UINavigationController, title : String = "Friends List".localized) -> InviteContactsViewController {
        let viewController = Storyboard.InviteEarn.instantiateViewController(identifier: InviteContactsViewController.storyboardIdentifier) as! InviteContactsViewController
        let contactService = ContactService(apiClient: apiClient)
        let inviteAndEarnService = InviteAndEarnService(apiClient: apiClient)
        viewController.viewModel = InviteContactsViewModel(contactSevice: contactService, authentication: authentication, invitAndEarnService: inviteAndEarnService, isDebitReferral: isDebitReferral)
        viewController.coordinator = InviteContactsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = title
        return viewController
    }
    func inviteDetailsViewController(navigationController: UINavigationController, referralType: String) -> InviteDetailsViewController {
        let viewController = Storyboard.InviteEarn.instantiateViewController(identifier: InviteDetailsViewController.storyboardIdentifier) as! InviteDetailsViewController
        let inviteAndEarnService = InviteAndEarnService(apiClient: apiClient)
        viewController.viewModel = InviteDetailsViewModel(authentication: authentication, inviteAndEarn: inviteAndEarnService, referralType: referralType)
        viewController.coordinator = InviteDetailsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        if referralType == "DebitCard" {
            viewController.title = "Referral Details".localized
        } else {
            viewController.title = "Invite Details".localized
        }
        return viewController
    }
    
    func betaInviteViewController(navigationController: UINavigationController) -> BetaInviteViewController {
        let viewController = Storyboard.InviteEarn.instantiateViewController(identifier: BetaInviteViewController.storyboardIdentifier) as! BetaInviteViewController
        let inviteAndEarnService = InviteAndEarnService(apiClient: apiClient)
        viewController.viewModel = BetaInviteViewModel(authentication: authentication, invitAndEarnService: inviteAndEarnService)
        viewController.coordinator = BetaInviteCoordinator(navigationCotroller: navigationController, viewControllerFactory: self)
        viewController.title = "Beta Invite".localized
        return viewController
    }
    ///Invite via code
    func invitationCodeDetailsViewController(inviteCode: String, navigationController: UINavigationController) -> InvitationCodeDetailsViewController {
        let viewController = Storyboard.InviteEarn.instantiateViewController(identifier: InvitationCodeDetailsViewController.storyboardIdentifier) as! InvitationCodeDetailsViewController
        let inviteAndEarnService = InviteAndEarnService(apiClient: apiClient)
        viewController.viewModel = InvitationCodeDetailsViewModel(authentication: authentication, inviteAndEarn: inviteAndEarnService, referralType: "", inviteCode: inviteCode)
        viewController.coordinator = InvitationCodeDetailsCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Invite Details"
        return viewController
    }
    
    
    //MARK: - E-Sports
    func eSportsTournamentsViewController(navigationController: UINavigationController) -> ESportsTournamentsViewController {
        let viewController = Storyboard.esports.instantiateViewController(identifier: ESportsTournamentsViewController.storyboardIdentifier) as! ESportsTournamentsViewController
        viewController.viewModel = ESportsTournamentsViewModel()
        viewController.coordinator = ESportsTournamentsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [newTournamentsViewController(navigationController: navigationController),myTournamentsViewController(navigationController: navigationController)]
        viewController.title = "E-Sports Tournaments".localized
        return viewController
    }
    func newTournamentsViewController(navigationController: UINavigationController) -> NewTournamentsViewController {
        let viewController = Storyboard.esports.instantiateViewController(identifier: NewTournamentsViewController.storyboardIdentifier) as! NewTournamentsViewController
        
        let eSportsService = ESportsService(apiClient: apiClient)
        viewController.viewModel = NewTournamentsViewModel(authentication: authentication, service: eSportsService)
        viewController.coordinator = NewTournamentsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func myTournamentsViewController(navigationController: UINavigationController) -> MyTournamentsViewController {
        let viewController = Storyboard.esports.instantiateViewController(identifier: MyTournamentsViewController.storyboardIdentifier) as! MyTournamentsViewController
        let eSportsService = ESportsService(apiClient: apiClient)
        viewController.viewModel = MyTournamentsViewModel(authentication: authentication, service: eSportsService)
        viewController.coordinator = MyTournamentsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "My Tournaments".localized
        return viewController
    }
    func playerRegistrationViewController(navigationController: UINavigationController, tournament: Tournament, tournamentConfiguration: TournamentConfiguration?) -> PlayerRegistrationViewController {
        let viewController = Storyboard.esports.instantiateViewController(identifier: PlayerRegistrationViewController.storyboardIdentifier) as! PlayerRegistrationViewController
        
        let eSportsService = ESportsService(apiClient: apiClient)
        
        viewController.viewModel = PlayerRegistrationViewModel(authentication: authentication, service: eSportsService, tournament: tournament, tournamentConfiguration: tournamentConfiguration)
        viewController.coordinator = PlayerRegistrationCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Register".localized
        return viewController
    }
    func esportsRegistrationAlertViewController(navigationController: UINavigationController, registeredTournament: RegisteredTournament) -> ESportsRegistrationAlertViewController  {
        let viewController = Storyboard.esports.instantiateViewController(identifier: ESportsRegistrationAlertViewController .storyboardIdentifier) as! ESportsRegistrationAlertViewController
        
        viewController.viewModel = ESportsRegistrationAlertViewModel(registeredTournament: registeredTournament)
        
        return viewController
    }
    func reviewPlayerViewController(navigationController: UINavigationController, tournamentId: Int, teamPlayers: [GamePlayer]) -> ReviewPlayerViewController {
        let viewController = Storyboard.esports.instantiateViewController(identifier: ReviewPlayerViewController.storyboardIdentifier) as! ReviewPlayerViewController
        
        let eSportsService = ESportsService(apiClient: apiClient)
        
        viewController.viewModel = ReviewPlayerViewModel(authentication: authentication, service: eSportsService, tournamentId: tournamentId, teamPlayers: teamPlayers)
        viewController.coordinator = ReviewPlayerCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review".localized
        return viewController
    }
    func myCardActiveViewContoller(isFromVirtualCard: Bool, navigationController: UINavigationController) -> CardSegmentViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: CardSegmentViewController.storyboardIdentifier) as! CardSegmentViewController
        viewController.viewModel = CardSegmentViewModel(debitCardModel: nil, configrations: configurations, eventManager: eventManager, isFromVirtualCard: isFromVirtualCard)
        viewController.coordinator = CardSegmentCoordinator(navigationController: navigationController, viewControllerFactory: self, tabbarController: nil)
        viewController.viewControllerItems = [
            activeDebitCardViewController(navigationController: navigationController),
            virtualCardLandingViewController(navigationController: navigationController)
        ]
        viewController.title = "My Cards".localized
        return viewController
    }
    
    func debitCardTabViewContoller(navigationController: UINavigationController, tabbarController: TabBarController?) -> DebitCardTabViewController {
        
        let viewController = Storyboard.card.instantiateViewController(identifier: DebitCardTabViewController.storyboardIdentifier) as! DebitCardTabViewController
        
        let storage = DashboardStorage()
        let debitCardService = DebitCardService(apiClient: apiClient)
        let dashboardService = DashboardService(apiClient: apiClient, storage: storage, updateCache: true)
        viewController.viewModel = DebitCardTabViewModel(authentication: authentication, debitCardService: debitCardService, service: dashboardService)
        viewController.coordinator = DebitCardTabCoordinator(navigationController: navigationController, viewControllerFactory: self, tabbarController: tabbarController)
        
        return viewController
    }
    
    func myCardStatusViewContoller(isFromVirtualCard: Bool, navigationController: UINavigationController, debitCardModel: DebitCardModel?, tabbarController: TabBarController?, onDebitCardActivation: @escaping (() -> Void)) -> CardSegmentViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: CardSegmentViewController.storyboardIdentifier) as! CardSegmentViewController
        viewController.viewModel = CardSegmentViewModel(debitCardModel: debitCardModel, configrations: configurations, eventManager: eventManager, isFromVirtualCard: isFromVirtualCard)
        viewController.coordinator = CardSegmentCoordinator(navigationController: navigationController, viewControllerFactory: self, tabbarController: tabbarController)
        viewController.viewControllerItems = [
            debitCardStatusViewController(navigationController: navigationController, debitCardModel: debitCardModel, onDebitCardActivation: onDebitCardActivation),
            virtualCardLandingViewController(navigationController: navigationController)
        ]
        viewController.title = "My Cards".localized
        return viewController
    }
    
    //MARK: Virtual Card
    func virtualCardLandingViewController(navigationController: UINavigationController) -> VirtualCardLandingViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: VirtualCardLandingViewController.storyboardIdentifier) as! VirtualCardLandingViewController
        let virtualCardService: VirtualCardServiceProtocol = VirtualCardService(apiClient: apiClient)
        viewController.viewModel = VirtualCardLandingViewModel(authentication: authentication, service: virtualCardService)
        viewController.coordinator = VirtualCardLandingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func virtualCardControlsViewController(card: VirtualCard, navigationController: UINavigationController) -> VirtualCardControlsViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: VirtualCardControlsViewController.storyboardIdentifier) as! VirtualCardControlsViewController
        let virtualCardService: VirtualCardServiceProtocol = VirtualCardService(apiClient: apiClient)
        viewController.viewModel = VirtualCardControlsViewModel(service: virtualCardService, authentication: authentication, card: card)
        viewController.coordinator = VirtualCardControlsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        let ultraService: UltraServiceProtocol = UltraService(apiClient: apiClient)
        viewController.ultraViewModel = UltraEnquiryCallViewModel(authentication: authentication, ultraService: ultraService)
        viewController.ultraCoordinator = UltraEnquiryCallViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func virtualCardCreatedViewController(cardDetails: VirtualCardBasicInformation, navigationController: UINavigationController) -> VirtualCardCreatedViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: VirtualCardCreatedViewController.storyboardIdentifier) as! VirtualCardCreatedViewController
        viewController.viewModel = VirtualCardCreatedViewModel(cardDetails: cardDetails)
        viewController.coordinator = VirtualCardCreatedCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func virtualCardCreatedeWithFeesViewController(cardDetails: VirtualCardBasicInformation, navigationController: UINavigationController) -> VirtualCardCreatedeWithFeesViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: VirtualCardCreatedeWithFeesViewController.storyboardIdentifier) as! VirtualCardCreatedeWithFeesViewController
        viewController.viewModel = VirtualCardCreatedViewModel(cardDetails: cardDetails)
        viewController.coordinator = VirtualCardCreatedCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func VirtualCardReviewViewController(cardDetails: VirtualCardBasicInformation, navigationController: UINavigationController) -> VirtualCardReviewViewController {
        let viewController = Storyboard.card.instantiateViewController(identifier: JSZindigi.VirtualCardReviewViewController.storyboardIdentifier) as! VirtualCardReviewViewController
        let service = VirtualCardService(apiClient: apiClient)
        viewController.viewModel = VirtualCardReviewViewModel(cardDetails: cardDetails, authentiication: authentication, service: service)
        viewController.coordinator = VirtualCardReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details"
        return viewController
    }
    
    //MARK: - E-Vouchers
    func eVouchersViewController(navigationController: UINavigationController) -> EVouchersViewController {
        let viewController = Storyboard.evouchers.instantiateViewController(identifier: EVouchersViewController.storyboardIdentifier) as! EVouchersViewController
        let evoucherService = EVoucherService(apiClient: apiClient)
        viewController.viewModel = EVouchersViewModel(authentication: authentication, evoucherService: evoucherService)
        viewController.coordinator = EVouchersCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "E-Vouchers".localized
        return viewController
    }
    func chooseVoucherViewController(navigationController: UINavigationController, sessionToken: String, selectedCompany: ProductAlteredLists) -> ChooseVoucherViewController {
        let viewController = Storyboard.evouchers.instantiateViewController(identifier: ChooseVoucherViewController.storyboardIdentifier) as! ChooseVoucherViewController
        viewController.viewModel = ChooseVoucherViewModel(sessionToken: sessionToken, selectedCompany: selectedCompany)
        viewController.coordinator = ChooseVoucherCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "E-Vouchers".localized
        return viewController
    }
    func howToUseVoucherViewController(navigationController: UINavigationController) -> HowToUseVoucherViewController {
        let viewController = Storyboard.evouchers.instantiateViewController(identifier: HowToUseVoucherViewController.storyboardIdentifier) as! HowToUseVoucherViewController
        viewController.viewModel = HowToUseVoucherViewModel()
        viewController.coordinator = HowToUseVoucherCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "E-Vouchers".localized
        return viewController
    }
    func evoucherReviewDetailsViewController(navigationController: UINavigationController,sessionToken: String, selectedCompany: ProductAlteredLists, selectedVoucher: ProductAlteredSubLists, email: String) -> ReviewDetailsViewController {
        let viewController = Storyboard.evouchers.instantiateViewController(identifier: ReviewDetailsViewController.storyboardIdentifier) as! ReviewDetailsViewController
        let evoucherService = EVoucherService(apiClient: apiClient)
        viewController.viewModel = ReviewDetailsViewModel(authentication: authentication, evoucherService: evoucherService, sessionToken: sessionToken, selectedCompany: selectedCompany, selectedVoucher: selectedVoucher,email: email)
        viewController.coordinator = ReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    func eVoucherPaymentReceiptViewController(navigationController: UINavigationController, purchasedVoucherResponse: VoucherDebitResponse, receiverName: String, voucherAmount: String) -> EVoucherPaymentReceiptViewController {
        let viewController = Storyboard.evouchers.instantiateViewController(identifier: EVoucherPaymentReceiptViewController.storyboardIdentifier) as! EVoucherPaymentReceiptViewController
        viewController.viewModel = EVoucherPaymentRecieptViewModel(purchasedVoucherResponse: purchasedVoucherResponse, authentication: authentication, receiverName: receiverName, voucherAmount: voucherAmount)
        viewController.coordinator = EVoucherPaymentRecieptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func voucherSubListViewController(voucherSubList: [ProductAlteredSubLists]) -> VoucherSubListViewController {
        let viewController = Storyboard.evouchers.instantiateViewController(identifier: VoucherSubListViewController.storyboardIdentifier) as! VoucherSubListViewController
        viewController.voucherSublist = voucherSubList
        return viewController
    }
    
    //MARK: General
    func cityViewController(title: String?, cities: [City], placeholder: String = "Search city by name".localized) -> CityViewController {
        let viewController = Storyboard.general.instantiateViewController(identifier: CityViewController.storyboardIdentifier) as! CityViewController
        viewController.titleText = title
        viewController.cities = cities
        viewController.placeholderText = placeholder
        
        return viewController
    }
    
    func countryViewController(title: String?, countries: [Country]) -> CountryViewController {
        let viewController = Storyboard.general.instantiateViewController(identifier: CountryViewController.storyboardIdentifier) as! CountryViewController
        viewController.titleText = title
        viewController.countries = countries
        
        return viewController
    }
    
    func datePickerViewController(selectedDate: Date, minimumDate: Date?, maximumDate: Date?, completion: @escaping (Date) -> Void) -> DatePickerViewController {
        let viewController = Storyboard.general.instantiateViewController(identifier: DatePickerViewController.storyboardIdentifier) as! DatePickerViewController
        viewController.selectedDate = selectedDate
        viewController.minimumDate = minimumDate
        viewController.maximumDate = maximumDate
        viewController.completion = completion
        viewController.dismissCompletion = { }
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        return viewController
    }
    
    func webViewController(url: URL,showClose: Bool) -> WebViewController {
        let viewController = Storyboard.general.instantiateViewController(identifier: WebViewController.storyboardIdentifier) as! WebViewController
        viewController.url = url
        viewController.showClose = showClose
        return viewController
    }
    
    func imagePickerViewController(captureMode: ImageCaptureMode) -> ImageCaptureViewController {
        let viewController = Storyboard.general.instantiateViewController(identifier: ImageCaptureViewController.storyboardIdentifier) as! ImageCaptureViewController
        viewController.captureMode = captureMode
        return viewController
    }
    
    func otpViewController(navigationController: UINavigationController, type: OTPType, otplength: Int, otpVerified: @escaping ((Bool) -> Void)) -> OTPViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: OTPViewController.storyboardIdentifier) as! OTPViewController
        viewController.viewModel = OTPViewModel(authentication: authentication, type: type, otplength: otplength)
        viewController.otpVerified = otpVerified
        return viewController
    }
    
    //MARK: - Promotions
    func homePromotionsViewController(navigationController: UINavigationController) -> PromotionsHomeViewController {
        let viewController = Storyboard.promotions.instantiateViewController(identifier: PromotionsHomeViewController.storyboardIdentifier) as! PromotionsHomeViewController
        let storage = DashboardStorage()
        let dashboardService = DashboardService(apiClient: apiClient, storage: storage, updateCache: true)
        viewController.viewModel = PromotionsHomeViewModel(mobile: authentication.user.mobileNumber, dashboardService: dashboardService, configurations: configurations)
        viewController.coordinator = PromotionsHomeCordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = " "
        return viewController
    }
    
    func promotionDetailsViewController(promotionItem: Promotion, navigationController: UINavigationController) -> PromotionDetailsViewController {
        let viewController = Storyboard.promotions.instantiateViewController(identifier: PromotionDetailsViewController.storyboardIdentifier) as! PromotionDetailsViewController
        // viewController.viewModel = PromotionsHomeViewModel()
        
        let dashboardStorage = DashboardStorage()
        let dashboardService = DashboardService(apiClient: apiClient, storage: dashboardStorage, updateCache: false)
        let debitCardService = DebitCardService(apiClient: apiClient)
        let stocksService = StocksService(apiClient: apiClient)
        let zspinService = ZSpinService(apiClient: apiClient)
        let mutualFundsService = MutualFundsService(apiClient: apiClient)
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        let efuService  = EFUService(apiClient: apiClient)
        
        viewController.viewModel = PromotionDetailsViewModel(promotionItem: promotionItem, payment: payment, authentication: authentication, zspinService: zspinService, mutualFundsService: mutualFundsService, dashboardStorage: dashboardStorage, debitCardService: debitCardService, dashboardService: dashboardService, stocksService: stocksService, configurations: configurations, efuService: efuService)
        viewController.coordinator = PromotionDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Promotions".localized
        return viewController
    }
    
    func fromOtherBankViewController(navigationController: UINavigationController) -> FromOtherBankViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: FromOtherBankViewController.storyboardIdentifier) as! FromOtherBankViewController
        viewController.viewModel = FromOtherBankViewModel(mobileNumber: self.authentication.user.mobileNumber, authentication: self.authentication)
        viewController.coordinator = FromOtherBankCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func scheduleTransactionsHistoryViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> ScheduleTransactionsHistoryViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ScheduleTransactionsHistoryViewController.storyboardIdentifier) as! ScheduleTransactionsHistoryViewController
        let scheduledTransaction = ScheduleTransactionService(apiClient: apiClient)
        
        viewController.viewModel = ScheduleTransactionsHistoryViewModel(scheduledTransaction: scheduledTransaction, mobileNumber: authentication.user.mobileNumber, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ScheduleTransactionsHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Schedule Transaction".localized
        return viewController
    }
    func requestMoneyHistoryViewController(navigationController: UINavigationController, isGiftHistory: Bool, isSplitEquality : Bool) -> RequestMoneyHistoryViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: RequestMoneyHistoryViewController.storyboardIdentifier) as! RequestMoneyHistoryViewController
        viewController.viewModel = RequestMoneyHistoryViewModel()
        viewController.coordinator = RequestMoneyHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [receivedRequestMoneyHistoryViewController(navigationController: navigationController, isReceived: true, isGiftHistory: isGiftHistory, isSplitEquality: isSplitEquality),receivedRequestMoneyHistoryViewController(navigationController: navigationController, isReceived: false,isGiftHistory: isGiftHistory, isSplitEquality: isSplitEquality)]
        viewController.title = "History".localized
        return viewController
    }
    func receivedRequestMoneyHistoryViewController(navigationController: UINavigationController,isReceived:Bool, isGiftHistory: Bool, isSplitEquality: Bool) -> ReceivedRequestMoneyHistoryViewController {
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ReceivedRequestMoneyHistoryViewController.storyboardIdentifier) as! ReceivedRequestMoneyHistoryViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = ReceivedRequestMoneyHistoryViewModel(service: transferMoneyService, mobileNo: self.authentication.user.mobileNumber,isReceived: isReceived,isGiftHistory: isGiftHistory, splitBillEnabled: isSplitEquality)
        viewController.coordinator = ReceivedRequestMoneyHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func receivedGiftRequestViewConntroller(navigationController: UINavigationController,screenType: RequestGiftMoney,screenTitle: String, splitBillEnabled : Bool) -> ReceivedGiftViewController {
        
        let viewController = Storyboard.transferMoney.instantiateViewController(identifier: ReceivedGiftViewController.storyboardIdentifier) as! ReceivedGiftViewController
        let transferMoneyService = TransferMoneyService(apiClient: apiClient)
        viewController.viewModel = ReceivedGiftViewModel(service: transferMoneyService, mobileNo: self.authentication.user.mobileNumber, screenType: screenType, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = ReceivedGiftCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = screenTitle
        return viewController
    }
    // MARK: -  Stocks
    func stocksOnboardingViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksOnboardingViewController {
        let viewController = Storyboard.stocks.instantiateViewController(withIdentifier: StocksOnboardingViewController.storyboardIdentifier) as! StocksOnboardingViewController
        viewController.viewModel = StocksOnboardingViewModel(userAndMarketStatus: userAndMarketStatus)
        viewController.coordinator = StocksOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Stocks".localized
        return viewController
    }
    //    func stocksHowItWorksViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksHowItWorksViewController {
    //        let viewController = Storyboard.stocks.instantiateViewController(withIdentifier: StocksHowItWorksViewController.storyboardIdentifier) as! StocksHowItWorksViewController
    //        viewController.coordinator = StocksOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
    //        viewController.viewModel = StocksHowItWorksViewModel(userAndMarketStatus: userAndMarketStatus)
    //        viewController.title = "Stocks"
    //        return viewController
    //    }
    func stocksViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StocksViewController.storyboardIdentifier) as! StocksViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = StocksViewModel(authentication: authentication, stocksService: stocksService, userAndMarketStatus: userAndMarketStatus)
        viewController.coordinator = StocksCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Stocks".localized
        return viewController
    }
    func srPersonalInformationViewController(stockGenericLists: StockGenericListsResponse, navigationController: UINavigationController) -> SRPersonalInformationViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: SRPersonalInformationViewController.storyboardIdentifier) as! SRPersonalInformationViewController
        viewController.viewModel = SRPersonalInformationViewModel(stockGenericLists: stockGenericLists, authentication: authentication)
        viewController.coordinator = SRPersonalInformationCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func srSourceOfIncomeViewController(stockGenericLists: StockGenericListsResponse, request: StocksRegistrationRequest, navigationController: UINavigationController) -> SRSourceOfIncomeViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: SRSourceOfIncomeViewController.storyboardIdentifier) as! SRSourceOfIncomeViewController
        viewController.viewModel = SRSourceOfIncomeViewModel(eventManager: self.eventManager, stockGenericLists: stockGenericLists, request: request)
        viewController.coordinator = SRSourceOfIncomeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func srDocumentsViewController(request: StocksRegistrationRequest, navigationController: UINavigationController) -> SRDocumentsViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: SRDocumentsViewController.storyboardIdentifier) as! SRDocumentsViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = SRDocumentsViewModel(stocksService: stocksService, authentication: authentication, request: request)
        viewController.coordinator = SRDocumentsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func stockDetailViewController(userAndMarketStatus: UserAndMarketDetails, stockDetail: MarketFeedDetailsResponse, isFromPortfolio: Bool, navigationController: UINavigationController) -> StockDetailViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StockDetailViewController.storyboardIdentifier) as! StockDetailViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = StockDetailViewModel(stocksService: stocksService, authentication: authentication, userAndMarketStatus: userAndMarketStatus, stockDetail: stockDetail, isFromPortfolio: isFromPortfolio)
        viewController.coordinator = StockDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Stocks".localized
        return viewController
    }
    func stocksPortfolioViewController(userPortfolio: PortfolioDetailsResponse, marketStatus: String, userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksPortfolioViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StocksPortfolioViewController.storyboardIdentifier) as! StocksPortfolioViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = StocksPortfolioViewModel(stocksService: stocksService, userPortfolio: userPortfolio, marketStatus: marketStatus, authentication: authentication, userAndMarketStatus: userAndMarketStatus)
        viewController.coordinator = StocksPortfolioCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "My Portfolio".localized
        return viewController
    }
    func stocksSearchViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksSearchViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StocksSearchViewController.storyboardIdentifier) as! StocksSearchViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = StocksSearchViewModel(authentication: authentication, stocksService: stocksService, userAndMarketStatus: userAndMarketStatus)
        viewController.coordinator = StocksSearchCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Stocks".localized
        return viewController
    }
    func stocksCashInCashOutViewController(cashIn: Bool, userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> StocksCashInCashOutViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StocksCashInCashOutViewController.storyboardIdentifier) as! StocksCashInCashOutViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = StocksCashInCashOutViewModel(stocksService: stocksService, cashIn: cashIn, authentication: authentication, userAndMarketStatus: userAndMarketStatus)
        viewController.coordinator = StocksCashInCashOutCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = cashIn ? "Cash In".localized : "Cash Out".localized
        return viewController
    }
    func stocksCashInReviewViewController(request: CashInOutRequest, navigationController: UINavigationController) -> StocksCashInReviewViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StocksCashInReviewViewController.storyboardIdentifier) as! StocksCashInReviewViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = StocksCashInReviewModel(stocksService: stocksService, request: request, authentication: authentication)
        viewController.coordinator = StocksCashInReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    func stocksCashInSuccessViewController(receiptData: CashInOutReceipt, navigationController: UINavigationController) -> StocksCashInSuccessViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StocksCashInSuccessViewController.storyboardIdentifier) as! StocksCashInSuccessViewController
        viewController.viewModel = StocksCashInSuccessViewModel(receiptData: receiptData, authentication: authentication)
        viewController.coordinator = StocksCashInSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func stocksCashOutReviewViewController(request: CashInOutRequest, navigationController: UINavigationController) -> StocksCashOutReviewViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StocksCashOutReviewViewController.storyboardIdentifier) as! StocksCashOutReviewViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = StocksCashOutReviewModel(stocksService: stocksService, request: request, authentication: authentication)
        viewController.coordinator = StocksCashOutReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    func stocksCashOutSuccessViewController(receiptData: CashInOutReceipt, navigationController: UINavigationController) -> StocksCashOutSuccessViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: StocksCashOutSuccessViewController.storyboardIdentifier) as! StocksCashOutSuccessViewController
        viewController.viewModel = StocksCashOutSuccessViewModel(receiptData: receiptData, authentication: authentication)
        viewController.coordinator = StocksCashOutSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func orderStockViewController(userAndMarketStatus: UserAndMarketDetails, navigationController: UINavigationController) -> OrderStockViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: OrderStockViewController.storyboardIdentifier) as! OrderStockViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = OrderStockViewModel(authentication: authentication, stocksService: stocksService, userAndMarketStatus: userAndMarketStatus)
        viewController.coordinator = OrderStockCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "My Orders".localized
        return viewController
    }
    func buySharesViewController(symbolCode: String, action: String, navigationController: UINavigationController) -> BuySharesViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: BuySharesViewController.storyboardIdentifier) as! BuySharesViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.coordinator = BuySharesCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewModel = BuySharesViewModel(stocksService: stocksService, authentication: authentication, symbolCode: symbolCode, action: action)
        viewController.title = action == "buy".localized ? "Buy Stocks".localized : "Sell Stocks".localized
        return viewController
    }
    func buySellSharesReviewViewController(request: NewOrderRequest, navigationController: UINavigationController) -> BuySellSharesReviewViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: BuySellSharesReviewViewController.storyboardIdentifier) as! BuySellSharesReviewViewController
        let stocksService = StocksService(apiClient: apiClient)
        viewController.viewModel = BuySellSharesReviewViewModel(stocksService: stocksService, authentication: authentication, newOrderRequest: request)
        viewController.coordinator = BuySellSharesReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    func buySellSharesSuccessViewController(request: NewOrderRequest, navigationController: UINavigationController) -> BuySellSharesSuccessViewController {
        let viewController = Storyboard.stocks.instantiateViewController(identifier: BuySellSharesSuccessViewController.storyboardIdentifier) as! BuySellSharesSuccessViewController
        viewController.viewModel = BuySellSharesSuccessViewModel(newOrderRequest: request)
        viewController.coordinator = BuySellSharesSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    //MARK: - Campus Director
    func campusDirectorViewController(bannerURL: String, mobileNumber: String, cnic: String, navigationController: UINavigationController) -> CampusDirectorViewController {
        let viewController = Storyboard.campusDirector.instantiateViewController(identifier: CampusDirectorViewController.storyboardIdentifier) as! CampusDirectorViewController
        viewController.viewModel = CampusDirectorViewModel(bannerURL: bannerURL, mobileNumber: mobileNumber, cnic: cnic)
        viewController.coordinator = CampusDirectorCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    
    func uploadDirectorDocumentsViewController(request: CampusDirectorRequest, navigationController: UINavigationController) -> UploadDirectorDocumentsViewController {
        let viewController = Storyboard.campusDirector.instantiateViewController(identifier: UploadDirectorDocumentsViewController.storyboardIdentifier) as! UploadDirectorDocumentsViewController
        let service: CampusDirectorServiceProtocol = CampusDirectorService(apiClient: apiClient)
        viewController.viewModel = UploadDirectorDocumentsViewModel(request: request, service: service)
        viewController.coordinator = UploadDirectorDocumentsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Campus Director".localized
        return viewController
    }
    
    func directorApplicationSubmissionSuccessViewController(name: String) -> DirectorApplicationSubmissionViewController {
        let viewController = Storyboard.campusDirector.instantiateViewController(identifier: DirectorApplicationSubmissionViewController.storyboardIdentifier) as! DirectorApplicationSubmissionViewController
        viewController.name = name
        return viewController
    }
    
    func imageSourceSheetViewController() -> ImageSourceSheetViewController {
        let viewController = Storyboard.campusDirector.instantiateViewController(identifier: ImageSourceSheetViewController.storyboardIdentifier) as! ImageSourceSheetViewController
        return viewController
    }
    
    //MARK: - EventsBanners
    func eventsBannerPopupViewController(navigationController: UINavigationController, popupBanner: PopupBanner) -> EventsBannerPopupViewController {
        let viewController = Storyboard.eventBanners.instantiateViewController(identifier: EventsBannerPopupViewController.storyboardIdentifier) as! EventsBannerPopupViewController
        let service = EventsBannerService(apiClient: apiClient)
        viewController.viewModel = EventsBannerPopupViewModel(authentication: authentication, service: service, popupBanner: popupBanner)
        return viewController
    }
    
    // MARK: -  Main: General
    func selectDropdownOptionViewController(titleText: String?, placeholderText: String  = "", dropDownData: [String]?, navigationController: UINavigationController) -> SelectDropdownOptionViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: SelectDropdownOptionViewController.storyboardIdentifier) as! SelectDropdownOptionViewController
        viewController.titleText = titleText
        viewController.searchPlaceholder = placeholderText
        viewController.dropDownData = dropDownData!
        return viewController
    }
    //MARK: - LoanProduct
    func loanProductBoardingViewController(navigationController: UINavigationController, onbaoardingResponse: LMSConfigBodyResponse, productID: Int, navigationTitle: String, lmsProductId: String) -> LoanProductBoardingViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanProductBoardingViewController.storyboardIdentifier) as! LoanProductBoardingViewController
        viewController.viewModel = LoanProductOnBoardingViewModel(onbaoardingResponse: onbaoardingResponse, productID: productID, lmsProductID: lmsProductId)
        viewController.coordinator = LoanProductOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.navigationTitle = navigationTitle
        return viewController
        
    }
    
    func loanProductHistoryViewController(lmsProductID: String, isFromBikeFinancing: Bool, navigationController: UINavigationController) -> LoanProductHistoryViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanProductHistoryViewController.storyboardIdentifier) as! LoanProductHistoryViewController
        let service = LoanProductService(apiClient: apiClient)
        viewController.viewModel = LoanProductHistoryViewModel(loanProductService: service, mobileNumber: self.authentication.user.mobileNumber, lmsProductID: lmsProductID, isFromBikeFinancing: isFromBikeFinancing)
        viewController.coordinator = LoanProductHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func loanRepaymentViewController(lmsProductId: String, navigationController: UINavigationController) -> LoanRepaymentViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanRepaymentViewController.storyboardIdentifier) as! LoanRepaymentViewController
        let service = LoanProductService(apiClient: apiClient)
        viewController.viewModel = LoanRepaymentViewModel(lmsProductId: lmsProductId, loanProductService: service, authentication: authentication)
        viewController.coordinator = LoanRepaymentCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Loan Repayment".localized
        return viewController
    }
    func loanProductReviewDetailsViewController(lmsProductID: String, navigationController: UINavigationController , receiptDataModel: RePaymentInqueryResponse, loanID : String) -> LoanProductReviewDetailsViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanProductReviewDetailsViewController.storyboardIdentifier) as! LoanProductReviewDetailsViewController
        let service = LoanProductService(apiClient: apiClient)
        viewController.viewModel = LoanProductReviewDetailsViewModel(lmsProductID: lmsProductID, loanProductService: service, authentication: authentication, receiptDataModel: receiptDataModel, loanID: loanID)
        viewController.coordinator = LoanProductReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    func loanProductTransferSuccessfullViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt? = nil, isHistory : Bool, isFromBikeFinancing: Bool, completion: @escaping (() -> Void)) -> LoanProductTransferSuccessfullViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanProductTransferSuccessfullViewController.storyboardIdentifier) as! LoanProductTransferSuccessfullViewController
        viewController.viewModel = LoanProductTransferSuccessfullViewModel(authentication: authentication, receiptModel: receiptModel, isHistory : isHistory, isFromBikeFinancing: isFromBikeFinancing)
        viewController.coordinator = LoanProductTransferSuccessfullCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        
        return viewController
    }
    func loanReceiptViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt? = nil, isHistory : Bool = true, isAdvanceSalary : Bool = false, isFromBikeFinancing: Bool, completion: @escaping (() -> Void)) -> LoanReceiptViewController {
        let viewController = Storyboard.loanProduct.instantiateViewController(identifier: LoanReceiptViewController.storyboardIdentifier) as! LoanReceiptViewController
        viewController.viewModel = LoanReceiptViewModel(authentication: authentication, receiptModel: receiptModel, isHistory : isHistory, isAdvanceSalary: isAdvanceSalary, isFromBikeFinancing: isFromBikeFinancing)
        viewController.coordinator = LoanReceiptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        
        return viewController
    }
    
    func forceUpdateViewController() -> ForceUpdateViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: ForceUpdateViewController.storyboardIdentifier) as! ForceUpdateViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        return viewController
    }

    
    func jsUserVerifyOtpViewController(navigationController: UINavigationController) -> JSUserVerifyOtpViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: JSUserVerifyOtpViewController.storyboardIdentifier) as! JSUserVerifyOtpViewController
        viewController.viewModel = JSUserVerifyOtpVeiwModel(authentication: authentication)
        viewController.coordinator = JSUserVerifyOtpCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func jsBankCreatePinViewController(navigationController: UINavigationController, otpPin: String) -> JSBankCreatePinViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: JSBankCreatePinViewController.storyboardIdentifier) as! JSBankCreatePinViewController
        viewController.viewModel = JSBankCreatePinViewModel(authentication: authentication, otpPin: otpPin)
        viewController.coordinator = JSBankCreatePinCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func jsBankVerifyVideoViewController(navigationController: UINavigationController, isUpdate: Bool = false) -> JSBankVerifyVideoViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: JSBankVerifyVideoViewController.storyboardIdentifier) as! JSBankVerifyVideoViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = JSBankVerifyVideoViewModel(service: service, authentication: authentication, isUpdate: isUpdate)
        viewController.coordinator = JSBankVerifyVideoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func jsBankVerifyViewController(navigationController: UINavigationController, selfie: String, isUpdated: Bool = false) -> JSBankVerifyViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: JSBankVerifyViewController.storyboardIdentifier) as! JSBankVerifyViewController
        let service = UltraService(apiClient: apiClient)
        viewController.viewModel = JSBankVerifyViewModel(service: service, authentication: authentication, selfieImage: selfie, isUpdate: isUpdated)
        viewController.coordinator = JSBankVerifyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }

    //MARK: -Pay Via Link
    
    func payViaLinkSuccessfulViewController(navigationController: UINavigationController, receiptModel: TransferPaymentReceipt, generateLink : String) -> PayViaLinkSuccessfulViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkSuccessfulViewController.storyboardIdentifier) as! PayViaLinkSuccessfulViewController
        viewController.viewModel = PayViaLinkSuccessfulViewModel(authentication: authentication, receiptModel: receiptModel, generateLink: generateLink)
        viewController.coordinator = PayViaLinkSuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func payViaLinkReviewViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse, remark : String, payerEmail : String, usdAmount : String, payerName : String, inquiryResponse: InquiryPayViaLinkResponse?) -> PayViaLinkReviewViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkReviewViewController.storyboardIdentifier) as! PayViaLinkReviewViewController
        let service = PayViaLinkService(apiClient: apiClient)
        viewController.viewModel = PayViaLinkReviewViewModel(authentication: authentication, payViaLinkService: service, payLinkConfigData: payLinkConfigData, remark: remark, payerEmail: payerEmail, inquiryResponse: inquiryResponse, usdAmount: usdAmount, payerName: payerName)
        viewController.coordinator = PayViaLinkReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func payViaLinkCreateViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse?) -> PayViaLinkCreateViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkCreateViewController.storyboardIdentifier) as! PayViaLinkCreateViewController
        let payViaLinkService = PayViaLinkService(apiClient: apiClient)
        viewController.viewModel = PayViaLinkCreateViewModel(authentication: authentication, payViaLinkService: payViaLinkService, payLinkConfigData: payLinkConfigData)
        viewController.coordinator = PayViaLinkCreateCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func payViaLinkHomeViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse, navigationTitle : String) -> PayViaLinkHomeViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkHomeViewController.storyboardIdentifier) as! PayViaLinkHomeViewController
        viewController.viewModel = PayViaLinkHomeViewModel(authentication: authentication, payLinkConfigData: payLinkConfigData)
        viewController.navigationItem.title = navigationTitle
        viewController.coordinator = PayViaLinkHomeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.navigationItem.title = navigationTitle
        return viewController
    }
    func payViaLinkOnBoardingViewController(navigationController: UINavigationController, onbaoardingResponse: PayViaLinkConfigResponse, navigationTitle : String) -> PayViaLinkOnBoardingViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkOnBoardingViewController.storyboardIdentifier) as! PayViaLinkOnBoardingViewController
        viewController.viewModel = PayViaLinkOnBoardingViewModel(onbaoardingResponse: onbaoardingResponse)
        viewController.coordinator = PayViaLinkOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.navigationTitle = navigationTitle
        return viewController
    }
    
    func payViaLinkAddressViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse?) -> PayViaLinkAddressViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkAddressViewController.storyboardIdentifier) as! PayViaLinkAddressViewController
        let payViaLinkService = PayViaLinkService(apiClient: apiClient)
        viewController.viewModel = PayViaLinkAddressViewModel(authentication: authentication, payViaLinkService: payViaLinkService, payLinkConfigData: payLinkConfigData)
        viewController.coordinator = PayViaLinkAddressCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func payViaLinkBasicInfoViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse?) -> PayViaLinkBasicInfoViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkBasicInfoViewController.storyboardIdentifier) as! PayViaLinkBasicInfoViewController
        viewController.viewModel = PayViaLinkBasicInfoViewModel(authentication: authentication, payLinkConfigData: payLinkConfigData)
        viewController.coordinator = PayViaLinkBasicInfoCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func payViaLinkHistoryViewController(navigationController: UINavigationController, segmentType: PayViaLinkSegmentType, initialIndex: Int, payLinkConfigData : PayViaLinkConfigBodyResponse) -> PayViaLinkHistoryViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkHistoryViewController.storyboardIdentifier) as! PayViaLinkHistoryViewController
        let service = PayViaLinkService(apiClient: apiClient)
        viewController.viewModel = PayViaLinkHistoryViewModel(payViaLinkService: service, mobileNumber: self.authentication.user.mobileNumber, segmentType: segmentType, initialIndex: initialIndex, payLinkConfigData: payLinkConfigData)
        viewController.coordinator = PayViaLinkHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "My Links".localized
        return viewController
    }
    
    func payLinkCancellationViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse, linkId : String) -> PayLinkCancellationViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayLinkCancellationViewController.storyboardIdentifier) as! PayLinkCancellationViewController
        let service = PayViaLinkService(apiClient: apiClient)
        viewController.viewModel = PayLinkCancellationViewModel(payLinkConfigData: payLinkConfigData, payViaLinkService: service, authentication: authentication, linkId: linkId)
        viewController.coordinator = PayLinkCancellationCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func payViaLinkRegistrationReviewViewController(navigationController: UINavigationController, payLinkConfigData: PayViaLinkConfigBodyResponse, address : String, freelancerUrl : String, inquiryResponse: InquiryPayViaLinkResponse?, city: String, province: String) -> PayViaLinkRegistrationReviewViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkRegistrationReviewViewController.storyboardIdentifier) as! PayViaLinkRegistrationReviewViewController
        let service = PayViaLinkService(apiClient: apiClient)
        viewController.viewModel = PayViaLinkRegistrationReviewViewModel(authentication: authentication, payViaLinkService: service, payLinkConfigData: payLinkConfigData, address: address, freelancerUrl: freelancerUrl, inquiryResponse: inquiryResponse, province: province, city: city)
        viewController.coordinator = PayViaLinkRegistrationReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func payViaLinkRegistrationSuccessfulViewController(navigationController: UINavigationController, receiptModel: TransferPaymentReceipt, responseMessage : String, completion: @escaping (() -> Void)) -> PayViaLinkRegistrationSuccessfulViewController {
        let viewController = Storyboard.payViaLink.instantiateViewController(identifier: PayViaLinkRegistrationSuccessfulViewController.storyboardIdentifier) as! PayViaLinkRegistrationSuccessfulViewController
        viewController.viewModel = PayViaLinkRegistrationSuccessfulViewModel(authentication: authentication, receiptModel: receiptModel, responseMessage: responseMessage)
        viewController.coordinator = PayViaLinkRegistrationSuccessfulCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        return viewController
    }
    
    //MARK: - Split Bill
    func splitBillOnBoardingViewController(navigationController: UINavigationController, onbaoardingResponse: SplitBillConfigBodyResponse, navigationTitle : String) -> SplitBillOnBoardingViewController {
        let viewController = Storyboard.splitBill.instantiateViewController(identifier: SplitBillOnBoardingViewController.storyboardIdentifier) as! SplitBillOnBoardingViewController
        viewController.viewModel = SplitBillOnBoardingViewModel(onbaoardingResponse: onbaoardingResponse)
        viewController.coordinator = SplitBillOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.navigationTitle = navigationTitle
        return viewController
    }
    func splitBillMenuViewController(splitBillItems : SplitBillConfigBodyResponse, navigationController: UINavigationController,  navigationTitle : String) -> SplitBillMenuViewController {
        let viewController = Storyboard.splitBill.instantiateViewController(identifier: SplitBillMenuViewController.storyboardIdentifier) as! SplitBillMenuViewController
        let service = SplitBillService(apiClient: apiClient)
        viewController.navigationTitle = navigationTitle
        viewController.viewModel = SplitBillMenuViewModel(splitBillItems: splitBillItems, authentication: self.authentication, service: service)
        viewController.coordinator = SplitBillMenuCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func splitBillHistoryViewController(navigationController: UINavigationController, segmentType: SplitBillSegmentType, initialIndex: Int) -> SplitBillHistoryViewController {
        let viewController = Storyboard.splitBill.instantiateViewController(identifier: SplitBillHistoryViewController.storyboardIdentifier) as! SplitBillHistoryViewController
        let service = SplitBillService(apiClient: apiClient)
        viewController.viewModel = SplitBillHistoryViewModel(splitBillService: service, mobileNumber: self.authentication.user.mobileNumber, segmentType: segmentType, initialIndex: initialIndex)
        viewController.coordinator = SplitBillHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "History".localized
        return viewController
    }
    func splitBillDetailViewController(navigationController: UINavigationController, transactionAmount: String = "", isTransactionReceipt : Bool = true , splitItResponse : SplitBillItResponse? = nil, isHistory : Bool = false) -> SplitBillDetailViewController {
        let viewController = Storyboard.splitBill.instantiateViewController(identifier: SplitBillDetailViewController.storyboardIdentifier) as! SplitBillDetailViewController
        let service = SplitBillService(apiClient: apiClient)
        viewController.viewModel = SplitBillDetailViewModel(authentication: authentication, service: service, transactionAmount : transactionAmount, isTransactionReceipt: isTransactionReceipt, splitItResponse: splitItResponse, isHistory: isHistory)
        viewController.coordinator = SplitBillDetailCoordinator(navigationController: navigationController, viewControllerFactory: self)
        
        return viewController
    }
    func splitBillReviewViewController(isEqualSplit: Bool, navigationController: UINavigationController, splitDescription : String, splitCategoryId : Int, isTransactionReceipt : Bool, selectedContactList: [[String : Any]], totalAmount: String, isHistory : Bool) -> SplitBillReviewViewController {
        let viewController = Storyboard.splitBill.instantiateViewController(identifier: SplitBillReviewViewController.storyboardIdentifier) as! SplitBillReviewViewController
        let service = SplitBillService(apiClient: apiClient)
        viewController.viewModel = SplitBillReviewViewModel(authentication: authentication, service: service, isEqualSplit: isEqualSplit, splitDescription: splitDescription, splitCategoryId: splitCategoryId, isTransactionReceipt: isTransactionReceipt, isHistory: isHistory, selectedContactList: selectedContactList, totalAmount: totalAmount)
        viewController.coordinator = SplitBillReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
        
    }
    func splitBillContactListViewController(navigationController: UINavigationController, splitAmount : String, isEqualySplit: Bool, splitCategoryID : Int, splitDescription : String, isTransactionReceipt: Bool, isHistory : Bool) -> SplitBillContactListViewController {
           let viewController = Storyboard.splitBill.instantiateViewController(identifier: SplitBillContactListViewController.storyboardIdentifier) as! SplitBillContactListViewController
           let contactService = ContactService(apiClient: apiClient)
           let splitBillservice = SplitBillService(apiClient: apiClient)
        viewController.viewModel = SplitBillContactListViewModel(contactSevice: contactService, authentication: self.authentication, splitBillservice: splitBillservice, splitAmount: splitAmount, isEqualySplit: isEqualySplit, splitCategoryID: splitCategoryID, splitDescription: splitDescription, isTransactionReceipt: isTransactionReceipt, isHistory: isHistory)
        viewController.navigationItem.title = "Split Between".localized
           viewController.coordinator = SplitBillContactListCoordinator(navigationController: navigationController, viewControllerFactory: self)
           return viewController
       }
    func splitBillOptionViewController(dropDownData: [CategoriesSplitBill], navigationController: UINavigationController) -> SelectSplitBillCategoryViewController {
        let viewController = Storyboard.splitBill.instantiateViewController(identifier: SelectSplitBillCategoryViewController.storyboardIdentifier) as! SelectSplitBillCategoryViewController
        viewController.dropDownData = dropDownData
        return viewController
    }
    
    // MARK: - EFU
    
    func onboardingEFUViewController(efuConfigurations: GetEFUConfigurationsResponse, navigationController: UINavigationController) -> OnboardingEFUViewController {
        let viewController = Storyboard.efu.instantiateViewController(withIdentifier: OnboardingEFUViewController.storyboardIdentifier) as! OnboardingEFUViewController
        viewController.coordinator = OnboardingEFUCoordinator(navigationController: navigationController, viewControllerFactory: self)
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = OnboardingEFUViewModel(authentication, efuService: efuService, efuConfigurations: efuConfigurations, eventManager: eventManager)
        viewController.title = "Insurance".localized
        return viewController
    }
    func insuranceHomeViewController(navigationController: UINavigationController) -> InsuranceHomeViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: InsuranceHomeViewController.storyboardIdentifier) as! InsuranceHomeViewController
        viewController.title = "Insurance".localized
        viewController.viewModel = InsuranceHomeViewModel(eventManager: eventManager)
        viewController.coordinator = InsuranceHomeCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [
            insurancePlanViewController(navigationController: navigationController),
            efuSubscribedPlansViewController(navigationController: navigationController)
        ]
        return viewController
    }
    func insurancePlanViewController(navigationController: UINavigationController) -> InsurancePlanViewController {
        let viewController = Storyboard.efu.instantiateViewController(withIdentifier: InsurancePlanViewController.storyboardIdentifier) as! InsurancePlanViewController
        viewController.coordinator = InsurancePlanCoordinator(navigationController: navigationController, viewControllerFactory: self)
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = InsurancePlanViewModel(authentication, efuService: efuService, eventManager: eventManager)
        return viewController
    }
    func efuSubscribedPlansViewController(navigationController: UINavigationController) -> EFUSubscribedPlansViewController {
        let viewController = Storyboard.efu.instantiateViewController(withIdentifier: EFUSubscribedPlansViewController.storyboardIdentifier) as! EFUSubscribedPlansViewController
        viewController.coordinator = EFUSubscribedPlansCoordinator(navigationController: navigationController, viewControllerFactory: self)
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = EFUSubscribedPlansViewModel(authentication, efuService: efuService)
        return viewController
    }
    func subscriptionPlanDetailsViewController(subscribedPlans: subscribedPlans, navigationController: UINavigationController) -> SubscriptionPlanDetailsViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: SubscriptionPlanDetailsViewController.storyboardIdentifier) as! SubscriptionPlanDetailsViewController
        viewController.title = "Plan Details".localized
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = SubscriptionPlanDetailsViewModel(authentication, efuService: efuService,subscribedPlans: subscribedPlans)
        viewController.coordinator = SubscriptionPlanDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func zindigiPlanViewController(productId: Int, insurancePlanName: String, termsUrl: String, bannerImg: String, navigationController: UINavigationController) -> ZindigiPlanViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: ZindigiPlanViewController.storyboardIdentifier) as! ZindigiPlanViewController
        viewController.title = insurancePlanName
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = ZindigiPlanViewModel(authentication, efuService: efuService, eventManager: eventManager, productId: productId, insurancePlanName: insurancePlanName, termsUrl: termsUrl, bannerImg: bannerImg)
        viewController.coordinator = ZindigiPlanCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func planDetailsViewController(subplanId: Int ,amount: String, planName: String, productId: Int , termsAndConditionsURL: String, beneficiaryMobile: String, navigationController: UINavigationController) -> PlanDetailsViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: PlanDetailsViewController.storyboardIdentifier) as! PlanDetailsViewController
        viewController.title = "Plan Details".localized
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = PlanDetailsViewModel(authentication, efuService: efuService, subplanId: subplanId ,amount: amount, planName: planName, productId: productId , termsAndConditionsURL: termsAndConditionsURL, beneficiaryMobile: beneficiaryMobile)
        viewController.coordinator = PlanDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func efuPlanReviewDetailsViewController(productId: Int, amount: String, insuranceType: String, planName: String, selectedPlanID: Int, email: String, relationshipWithBeneficiary: String, beneficiaryName: String, beneficiaryMobile: String, isUnderAge: Bool, guardianName: String, guardianRelationship: String, navigationController: UINavigationController) -> EFUPlanReviewDetailsViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: EFUPlanReviewDetailsViewController.storyboardIdentifier) as! EFUPlanReviewDetailsViewController
        viewController.title = "Review Details".localized
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = EFUPlanReviewDetailsViewModel(authentication, efuService: efuService, eventManager: eventManager, productId: productId, amount: amount, insuranceType: insuranceType, planName: planName, selectedPlanID: selectedPlanID, email: email, relationshipWithBeneficiary: relationshipWithBeneficiary, beneficiaryName: beneficiaryName, beneficiaryMobile: beneficiaryMobile, isUnderAge: isUnderAge, guardianName: guardianName, guardianRelationship: guardianRelationship)
        viewController.coordinator = EFUPlanReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func efuPlanSuccessReceiptViewController(receiptData: InsuranceReceipt, navigationController: UINavigationController) -> EFUPlanSuccessReceiptViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: EFUPlanSuccessReceiptViewController.storyboardIdentifier) as! EFUPlanSuccessReceiptViewController
        viewController.title = "Comprehensive Shield Plan".localized
        viewController.viewModel = EFUPlanSuccessReceiptViewModel(receipData: receiptData)
        viewController.coordinator = EFUPlanSuccessReceiptCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func subscribePlanViewController(productId: Int , amount: String, insuranceType: String, planName: String, selectedPlanID: Int, termsAndConditionsURL: String, beneficiaryMobile: String, navigationController: UINavigationController) -> SubscribePlanViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: SubscribePlanViewController.storyboardIdentifier) as! SubscribePlanViewController
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = SubscribePlanViewModel(authentication, efuService: efuService, eventManager: eventManager, productId: productId , amount: amount, insuranceType: insuranceType, planName: planName, selectedPlanID: selectedPlanID, termsAndConditionsURL: termsAndConditionsURL, beneficiaryMobile: beneficiaryMobile)
        viewController.coordinator = SubscribePlanCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    func claimInsuranceViewController(insurancePlan: String, insurerName: String, productID: Int, amount: String, navigationController: UINavigationController) -> ClaimInsuranceViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: ClaimInsuranceViewController.storyboardIdentifier) as! ClaimInsuranceViewController
        viewController.title = "Claim Insurance".localized
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = ClaimInsuranceViewModel(authentication, efuService: efuService, insurancePlan: insurancePlan, insurerName: insurerName, productID: productID, amount: amount)
        return viewController
    }
    func filledClaimsViewController(navigationController: UINavigationController) -> FilledClaimsViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: FilledClaimsViewController.storyboardIdentifier) as! FilledClaimsViewController
        viewController.title = "Claims".localized
        let efuService  = EFUService(apiClient: apiClient)
        viewController.viewModel = FilledClaimsViewModel(authentication, efuService: efuService)
        return viewController
    }
    func coverageDetailsViewController(title: String, details: [String], navigationController: UINavigationController) -> CoverageDetailsViewController {
        let viewController = Storyboard.efu.instantiateViewController(identifier: CoverageDetailsViewController.storyboardIdentifier) as! CoverageDetailsViewController
        viewController.viewModel = CoverageDetailsViewModel(title: title, details: details)
        return viewController
    }
    func miniAppWebViewController(url: URL) -> MiniAppWebViewController {
        let viewController = Storyboard.miniApps.instantiateViewController(identifier: MiniAppWebViewController.storyboardIdentifier) as! MiniAppWebViewController
        viewController.url = url
        return viewController
    }
    
    //MARK: - Fuel Pocket
    func fuelPocketOnboardingViewController(petroPocketConfigResponse: PetroPocketConfigResponse, navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelPocketOnboardingViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: FuelPocketOnboardingViewController.storyboardIdentifier) as! FuelPocketOnboardingViewController
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = FuelPocketOnboardingViewModel(fuelPocketService: fuelPocketService, authentication: authentication, petroPocketConfigResponse: petroPocketConfigResponse, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = FuelPocketOnboardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Fuel Pocket".localized
        return viewController
    }
    
    func fuelPocketDashboardViewController(petroPocketConfigResponse: PetroPocketConfigResponse, navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelPocketDashboardViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: FuelPocketDashboardViewController.storyboardIdentifier) as! FuelPocketDashboardViewController
        //        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = FuelPocketDashboardViewModel(petroPocketConfigResponse: petroPocketConfigResponse, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = FuelPocketDashboardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Fuel Pocket".localized
        return viewController
    }
    
    func giftFuelViewController(isNumberEditable: Bool, petroPocketConfigResponse: PetroPocketConfigResponse, navigationController: UINavigationController, splitBillEnabled : Bool) -> GiftFuelViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: GiftFuelViewController.storyboardIdentifier) as! GiftFuelViewController
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = GiftFuelViewModel(isNumberEditable: isNumberEditable, fuelPocketService: fuelPocketService, petroPocketConfigResponse: petroPocketConfigResponse, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = GiftFuelCoordinator(navigationController: navigationController, viewControllerFactory: self)
        let formattedText = "\u{200E} پر منتقل کریں۔ Zindigi"
        isNumberEditable ? (viewController.title = "Gift Petrol".localized) : (viewController.title = Language.current.direction == .forceLeftToRight ? "Transfer to Zindigi" : formattedText)
        return viewController
    }
    
    func fuelPocketTopUpViewController(navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelPocketTopUpViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: FuelPocketTopUpViewController.storyboardIdentifier) as! FuelPocketTopUpViewController
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = FuelPocketTopUpViewModel(fuelPocketService: fuelPocketService, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = FuelPocketTopUpCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Top Up".localized
        return viewController
    }
    
    func giftFuelReviewViewController(giftFuelRequest: GiftFuelRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> GiftFuelReviewViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: GiftFuelReviewViewController.storyboardIdentifier) as! GiftFuelReviewViewController
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = GiftFuelReviewViewModel(fuelPocketService: fuelPocketService, authentication: authentication, giftFuelRequest: giftFuelRequest, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = GiftFuelReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    
    func giftFuelSuccessViewController(giftFuelRequest: GiftFuelRequest, navigationController: UINavigationController, splitBillEnabled: Bool) -> GiftFuelSuccessViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: GiftFuelSuccessViewController.storyboardIdentifier) as! GiftFuelSuccessViewController
        viewController.viewModel = GiftFuelSuccessViewModel(giftFuelRequest: giftFuelRequest, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = GiftFuelSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func fuelRatesViewController(petroPocketConfigResponse: PetroPocketConfigResponse, navigationController: UINavigationController) -> FuelRatesViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: FuelRatesViewController.storyboardIdentifier) as! FuelRatesViewController
        //        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = FuelRatesViewModel(petroPocketConfigResponse: petroPocketConfigResponse)
        viewController.coordinator = FuelRatesCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Fuel Rates".localized
        return viewController
    }
    
    func fuelTopUpReviewViewController(topUpAmount: String, topUpRequest: PetroTopUpRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelTopUpReviewViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: FuelTopUpReviewViewController.storyboardIdentifier) as! FuelTopUpReviewViewController
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = FuelTopUpReviewViewModel(topUpAmount: topUpAmount, topUpRequest: topUpRequest, fuelPocketService: fuelPocketService, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = FuelTopUpReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    
    func fuelTopUpSuccessViewController(topUpAmount: String, topUpRequest: PetroTopUpRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> FuelTopUpSuccessViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: FuelTopUpSuccessViewController.storyboardIdentifier) as! FuelTopUpSuccessViewController
        viewController.viewModel = FuelTopUpSuccessViewModel(topUpAmount: topUpAmount, topUpRequest: topUpRequest, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = FuelTopUpSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func transferFuelReviewViewController(giftFuelRequest: GiftFuelRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> TransferFuelReviewViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: TransferFuelReviewViewController.storyboardIdentifier) as! TransferFuelReviewViewController
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = TransferFuelReviewViewModel(giftFuelRequest: giftFuelRequest, fuelPocketService: fuelPocketService, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = TransferFuelReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    
    func transferFuelSuccessViewController(giftFuelRequest: GiftFuelRequest, navigationController: UINavigationController, splitBillEnabled : Bool) -> TransferFuelSuccessViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: TransferFuelSuccessViewController.storyboardIdentifier) as! TransferFuelSuccessViewController
        viewController.viewModel = TransferFuelSuccessViewModel(giftFuelRequest: giftFuelRequest, authentication: authentication, splitBillEnabled: splitBillEnabled)
        viewController.coordinator = TransferFuelSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func fuelPocketHistoryViewController(navigationController: UINavigationController) -> FuelPocketHistoryViewController {
        let viewController = Storyboard.fuelPocket.instantiateViewController(identifier: FuelPocketHistoryViewController.storyboardIdentifier) as! FuelPocketHistoryViewController
        let fuelPocketService = FuelPocketService(apiClient: apiClient)
        viewController.viewModel = FuelPocketHistoryViewModel(fuelPocketService: fuelPocketService, authentication: authentication)
        viewController.coordinator = FuelPocketHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "History".localized
        return viewController
    }
  
    //MARK: - Islamic Savings
    func islamicSavingsIntroViewController(navigationController: UINavigationController, islamicPlanResponse: IslamicSavingPlanResponse) -> IslamicSavingsIntroViewController {
        let viewController = Storyboard.islamicSavings.instantiateViewController(identifier: IslamicSavingsIntroViewController.storyboardIdentifier) as! IslamicSavingsIntroViewController
        let islamicSavingsService = IslamicSavingsService(apiClient: apiClient)
        viewController.viewModel = IslamicSavingsIntroViewModel(islamicSavingsService: islamicSavingsService, authentication: authentication, islamicPlanResponse: islamicPlanResponse)
        viewController.coordinator = IslamicSavingsIntroCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Islamic Savings".localized
        return viewController
    }
    
    func islamicSavingsAmountViewController(navigationController: UINavigationController, islamicPlanResponse: IslamicSavingPlanResponse, isFromInvestment: Bool) -> IslamicSavingsAmountViewController {
        let viewController = Storyboard.islamicSavings.instantiateViewController(identifier: IslamicSavingsAmountViewController.storyboardIdentifier) as! IslamicSavingsAmountViewController
        let islamicSavingsService = IslamicSavingsService(apiClient: apiClient)
        viewController.viewModel = IslamicSavingsAmountViewModel(islamicSavingsService: islamicSavingsService, authentication: authentication, islamicPlanResponse: islamicPlanResponse, isFromInvestment: isFromInvestment)
        viewController.coordinator = IslamicSavingsAmountCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Islamic Savings".localized
        return viewController
    }
    
    func islamicSavingsDashboardViewController(navigationController: UINavigationController, islamicPlanResponse: IslamicSavingPlanResponse) -> IslamicSavingsDashboardViewController {
        let viewController = Storyboard.islamicSavings.instantiateViewController(identifier: IslamicSavingsDashboardViewController.storyboardIdentifier) as! IslamicSavingsDashboardViewController
        let islamicSavingsService = IslamicSavingsService(apiClient: apiClient)
        viewController.viewModel = IslamicSavingsDashboardViewModel(islamicSavingsService: islamicSavingsService, authentication: authentication, islamicPlanResponse: islamicPlanResponse, islamicservice: islamicSavingsService)
        viewController.coordinator = IslamicSavingsDashboardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Islamic Savings".localized
        return viewController
    }
    
    func islamicSavingsReviewDetailsViewController(savingAmount: String, navigationController: UINavigationController, plainID: Int,  savingPlain: String, saving: String, isFromInvestment: Bool, islamicSavingConfigurations: IslamicSavingConfiguration, fees: String) -> IslamicSavingsReviewDetailsViewController {
        let viewController = Storyboard.islamicSavings.instantiateViewController(identifier: IslamicSavingsReviewDetailsViewController.storyboardIdentifier) as! IslamicSavingsReviewDetailsViewController
        let islamicSavingsService = IslamicSavingsService(apiClient: apiClient)
        viewController.viewModel = IslamicSavingsReviewDetailsViewModel(savingAmount: savingAmount, islamicSavingsService: islamicSavingsService, authentication: authentication, plainID: plainID, savingPlain: savingPlain, saving: saving, isBankInvest: isFromInvestment, islamicSavingConfigurations: islamicSavingConfigurations, fees: fees)
        viewController.coordinator = IslamicSavingsReviewDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    
    func islamicSavingsPaymentsViewController(navigationController: UINavigationController, receiptModel:TransferPaymentReceipt? = nil ,isFromInvestment: Bool, widthdrawlReceiptInfoMessage: String, completion: @escaping (() -> Void)) -> IslamicSavingsPaymentsViewController {
        let viewController = Storyboard.islamicSavings.instantiateViewController(identifier: IslamicSavingsPaymentsViewController.storyboardIdentifier) as! IslamicSavingsPaymentsViewController
        viewController.viewModel = IslamicSavingsPaymentsViewModel(authentication: authentication, receiptModel: receiptModel, isBankInvest: isFromInvestment, widthdrawlReceiptInfoMessage: widthdrawlReceiptInfoMessage)
        viewController.coordinator = IslamicSavingsPaymentCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        
        return viewController
    }
    
    func islamicSavingsMoreViewController(navigationController: UINavigationController, faqs: [IslamicSavingFaq], bannerUrl: String) -> IslamicSavingsMoreViewController {
        let viewController = Storyboard.islamicSavings.instantiateViewController(identifier: IslamicSavingsMoreViewController.storyboardIdentifier) as! IslamicSavingsMoreViewController
        viewController.title = "Islamic Savings".localized
        let faqService = FAQService(apiClient: apiClient)
        viewController.coordinator = IslamicSavingsMoreCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewModel = IslamicSavingsMoreViewModel(authentication: authentication, faqService: faqService, faqs: faqs, bannerUrl: bannerUrl)
        return viewController
    }
    
    func islamicSavingsMoreDetailsViewController(navigationController: UINavigationController, faqQuestion: FAQModel) -> IslamicSavingsMoreDetailsViewController {
        let viewController = Storyboard.islamicSavings.instantiateViewController(identifier: IslamicSavingsMoreDetailsViewController.storyboardIdentifier) as! IslamicSavingsMoreDetailsViewController
        viewController.faqQuestion = faqQuestion
        viewController.viewModel = IslamicSavingsMoreDetailsViewModel(chatManager: chatManager, intercomEnabled: configurations.isIntercomEnabled)
        viewController.coordinator = IslamicSavingsMoreDetailsCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func certificatesLandingViewController(accountCertificatesData : AccountCertificateLandingResponse,navigationController: UINavigationController) -> CertificatesLandingViewController {
        let viewController = Storyboard.accountCertificates.instantiateViewController(identifier: CertificatesLandingViewController.storyboardIdentifier) as! CertificatesLandingViewController
        viewController.viewModel = CertificatesLandingViewModel(accountCertificateData: accountCertificatesData)
        viewController.coordinator = CertificatesLandingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func accountStatementViewController(certificateType : String, heading : String, accountCertificatesData : AccountCertificateLandingResponse,navigationController: UINavigationController) -> AccountStatementViewController {
        let accountCertificateService = AccountCertificatesService(apiClient: apiClient)
        let viewController = Storyboard.accountCertificates.instantiateViewController(identifier: AccountStatementViewController.storyboardIdentifier) as! AccountStatementViewController
        viewController.viewModel = AccountStatementViewModel(certificateType  : certificateType , heading: heading ,authentication: authentication, accountCertificateData: accountCertificatesData, accountCertificateService: accountCertificateService)
        viewController.coordinator = AccountStatementCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func taxCertificateViewController(certificateType : String, heading : String, accountCertificatesData : AccountCertificateLandingResponse,navigationController: UINavigationController) -> TaxCertificateViewController {
        let accountCertificateService = AccountCertificatesService(apiClient: apiClient)
        let viewController = Storyboard.accountCertificates.instantiateViewController(identifier: TaxCertificateViewController.storyboardIdentifier) as! TaxCertificateViewController
        viewController.viewModel = TaxCertificateViewModel(certificateType  : certificateType , heading: heading, accountCertificateService: accountCertificateService, accountCertificateData: accountCertificatesData , authentication: authentication)
        viewController.coordinator = TaxCertificateCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func accountMaintenanceViewController(certificateType : String, heading : String, accountCertificatesData : AccountCertificateLandingResponse ,navigationController: UINavigationController) -> AccountMaintenanceViewController {
        let service = AccountCertificatesService(apiClient: apiClient)
        let viewController = Storyboard.accountCertificates.instantiateViewController(identifier: AccountMaintenanceViewController.storyboardIdentifier) as! AccountMaintenanceViewController
        viewController.viewModel = AccountMaintenanceViewModel(certificateType  : certificateType, heading: heading ,authentication: authentication, accountCertificateData: accountCertificatesData, accountCertificateService: service)
        viewController.coordinator = AccountMaintenanceCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func userFeedbackViewController(lastActivity: String, navigationController: UINavigationController) -> UserFeedbackViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: UserFeedbackViewController.storyboardIdentifier) as! UserFeedbackViewController
        let userFeedbackService = UserFeedbackService(apiClient: apiClient)
        viewController.viewModel = UserFeedbackViewModel(userFeedbackService: userFeedbackService, lastActivity: lastActivity)
        viewController.coordinator = UserFeedbackCoordinator(viewControllerFactory: self, navigationController: navigationController)
        return viewController
    }
    
    func lowRatingPopupViewController() -> LowRatingPopupViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: LowRatingPopupViewController.storyboardIdentifier) as! LowRatingPopupViewController
        return viewController
    }
    
    //MARK: - Bike Financing
    func bikeFinancingMenuViewController(lmsProductID: String, navigationController: UINavigationController) -> BikeFinancingMenuViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingMenuViewController.storyboardIdentifier) as! BikeFinancingMenuViewController
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        viewController.viewModel = BikeFinancingMenuViewModel(lmsProductID: lmsProductID, bikeFinancingService: bikeFinancingService, authentication: authentication)
        viewController.coordinator = BikeFinancingMenuCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Bikes".localized
        return viewController
    }
    
    func bikeFinancingOnboardingViewController(lmsProductID: String, bikeFinancingConfigResponse: BikeFinancingConfigResponse, navigationController: UINavigationController) -> BikeFinancingOnboardingViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingOnboardingViewController.storyboardIdentifier) as! BikeFinancingOnboardingViewController
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        viewController.viewModel = BikeFinancingOnboardingViewModel(bikeFinancingService: bikeFinancingService, authentication: authentication, bikeFinancingConfigResponse: bikeFinancingConfigResponse, lmsProductID: lmsProductID)
        viewController.coordinator = BikeFinancingOnboardingCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Bike Financing".localized
        return viewController
    }
    
    func instalmentPlansViewController(lmsProductByIdResponse: GetLMSProductByIdResponse, bikeProductDetails: BikeModelDetails, navigationController: UINavigationController) -> InstalmentPlansViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: InstalmentPlansViewController.storyboardIdentifier) as! InstalmentPlansViewController
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        let loanProductService = LoanProductService(apiClient: apiClient)
        viewController.viewModel = InstalmentPlansViewModel(lmsProductByIdResponse: lmsProductByIdResponse, bikeProductDetails: bikeProductDetails, bikeFinancingService: bikeFinancingService, loanProductService: loanProductService, authentication: authentication)
        viewController.coordinator = InstalmentPlansCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Payment Plan".localized
        return viewController
    }
    
    func bikeFinancingVerifyAccountViewController(selectedBikeDetails: BikeModelDetails, navigationController: UINavigationController) -> BikeFinancingVerifyAccountViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingVerifyAccountViewController.storyboardIdentifier) as! BikeFinancingVerifyAccountViewController
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        viewController.viewModel = BikeFinancingVerifyAccountViewModel(selectedBikeDetails: selectedBikeDetails, bikeFinancingService: bikeFinancingService, authentication: authentication)
        viewController.coordinator = BikeFinancingVerifyAccountCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Verify Account".localized
        return viewController
    }
    
    func bikeFinancingLoansViewController(lmsProductId: String, navigationController: UINavigationController) -> BikeFinancingLoansViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingLoansViewController.storyboardIdentifier) as! BikeFinancingLoansViewController
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        let loanProductService = LoanProductService(apiClient: apiClient)
        viewController.viewModel = BikeFinancingLoansViewModel(lmsProductId: lmsProductId, bikeFinancingService: bikeFinancingService, loanProductService: loanProductService, authentication: authentication)
        viewController.coordinator = BikeFinancingLoansCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "My Loans".localized
        return viewController
    }
    
    func bikeFinancingReviewViewController(lmsProductID: String, loanID: String? = nil, bikeFinancingPaymentScenario: BikeFinancingPaymentScenario, selectedBikeDetails: BikeModelDetails? = nil, rePaymentInqueryResponse: RePaymentInqueryResponse? = nil, lmsLoanSettlementInfo: LmsLoanSettlementInfoResponse? = nil, pendingLoanDetails: PendingLoanInstallmentDetailsPayLoadResponse? = nil, navigationController: UINavigationController) -> BikeFinancingReviewViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingReviewViewController.storyboardIdentifier) as! BikeFinancingReviewViewController
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        let loanProductService = LoanProductService(apiClient: apiClient)
        viewController.viewModel = BikeFinancingReviewViewModel(lmsProductID: lmsProductID, loanID: loanID, bikeFinancingPaymentScenario: bikeFinancingPaymentScenario, selectedBikeDetails: selectedBikeDetails, rePaymentInqueryResponse: rePaymentInqueryResponse, lmsLoanSettlementInfo: lmsLoanSettlementInfo, pendingLoanDetails: pendingLoanDetails, bikeFinancingService: bikeFinancingService, loanProductService: loanProductService, authentication: authentication)
        viewController.coordinator = BikeFinancingReviewCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Review Details".localized
        return viewController
    }
    
    func bikeLoanRepaymentScheduleViewController(lmsProductID: String, navigationController: UINavigationController) -> BikeLoanRepaymentScheduleViewController{
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeLoanRepaymentScheduleViewController.storyboardIdentifier) as! BikeLoanRepaymentScheduleViewController
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        viewController.viewModel = BikeLoanRepaymentScheduleViewModel(lmsProductID: lmsProductID, bikeFinancingService: bikeFinancingService, authentication: authentication)
        viewController.title = "Repayment Schedule".localized
        return viewController
    }
    
    func bikeFinancingCategoriesViewController(lmsProductID: String, navigationController: UINavigationController) -> BikeFinancingCategoriesViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingCategoriesViewController.storyboardIdentifier) as! BikeFinancingCategoriesViewController
        let bikeFinancingService = BikeFinancingService(apiClient: apiClient)
        viewController.viewModel = BikeFinancingCategoriesViewModel(lmsProductID: lmsProductID, bikeFinancingService: bikeFinancingService, authentication: authentication)
        viewController.coordinator = BikeFinancingCategoriesCoordinator(viewControllerFactory: self, navigationController: navigationController)
        viewController.title = "Product Selection".localized
        return viewController
    }
    
    func bikeFinancingSuccessViewController(navigationController: UINavigationController, receiptModel: BikeFinancingSuccessReceipt? = nil, isHistory: Bool, completion: @escaping (() -> Void)) -> BikeFinancingSuccessViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingSuccessViewController.storyboardIdentifier) as! BikeFinancingSuccessViewController
        viewController.viewModel = BikeFinancingSuccessViewModel(authentication: authentication, receiptModel: receiptModel, isHistory : isHistory)
        viewController.coordinator = BikeFinancingSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        return viewController
    }
    
    func bikeFinancingFullPaymentSuccessViewController(navigationController: UINavigationController, receiptModel: BikeFinancingSuccessReceipt?, completion: @escaping (() -> Void)) -> BikeFinancingFullPaymentSuccessViewController {
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingFullPaymentSuccessViewController.storyboardIdentifier) as! BikeFinancingFullPaymentSuccessViewController
        viewController.viewModel = BikeFinancingFullPaymentSuccessViewModel(authentication: authentication, receiptModel: receiptModel)
        viewController.coordinator = BikeFinancingSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        return viewController
    }
    
    func bikeFinancingInstallmentSuccessViewController(navigationController: UINavigationController, receiptModel: BikeFinancingSuccessReceipt?, completion: @escaping (() -> Void)) -> BikeFinancingInstallmentSuccessViewController{
        let viewController = Storyboard.bikeFinancing.instantiateViewController(identifier: BikeFinancingInstallmentSuccessViewController.storyboardIdentifier) as! BikeFinancingInstallmentSuccessViewController
        viewController.viewModel = BikeFinancingInstallmentSuccessViewModel(authentication: authentication, receiptModel: receiptModel)
        viewController.coordinator = BikeFinancingSuccessCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        return viewController
    
}
    

//MARK: - ZSPorts
func zSportsOnBoardingViewController(navigationController: UINavigationController, model: ZSportsGetConfigrationResponse) -> ZSportsOnBoardingViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportsOnBoardingViewController.storyboardIdentifier) as! ZSportsOnBoardingViewController
    let ZSportService = ZSportServices(apiClient: apiClient)
    viewController.viewModel = ZSportsOnBoardingViewModel(authentication: authentication, service: ZSportService, staterModel: model)
    viewController.coordinator = ZSportsOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.title = "Z Sports"
    return viewController
}
func zSportsStaterViewController(navigationController: UINavigationController, model: ZSportsGetConfigrationResponse) -> ZSportsStaterViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportsStaterViewController.storyboardIdentifier) as! ZSportsStaterViewController
    let ZSportService = ZSportServices(apiClient: apiClient)
    viewController.viewModel = ZSportsStaterViewModel(authentication: authentication, service: ZSportService, zSportsGetConfigrationData: model)
    viewController.coordinator = ZSportsStaterCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.title = "Sports Complex"
    return viewController
}
func zSportsSelectCityViewController(navigationController: UINavigationController, locationType: LocationType) -> ZSportsSelectCityViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportsSelectCityViewController.storyboardIdentifier) as! ZSportsSelectCityViewController
    let locateUsService = LocateUsService(apiClient: apiClient)
    let locateUs = LocateUs(service: locateUsService)
    let ZSportService = ZSportServices(apiClient: apiClient)
    viewController.viewModel = ZSportsSelectCityViewModel(authentication: authentication,locateUs: locateUs, locationType: locationType, service: ZSportService)
    viewController.coordinator = ZSportsSelectCityCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.title = "Book Sports Complex"
    return viewController
}
func zSportsSelectSportViewController(navigationController: UINavigationController, complexListData: ComplexList, cityName: String) -> ZSportsSelectSportViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportsSelectSportViewController.storyboardIdentifier) as! ZSportsSelectSportViewController
    viewController.viewModel = ZSportsSelectSportViewModel(authentication: authentication, complexListData: complexListData, cityName: cityName)
    viewController.coordinator = ZSportsSelectSportCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.title = "Book Sports Complex"
    return viewController
}

func zSportsSlotSelectionViewController(navigationController: UINavigationController, sportCategory: AvailableSports, complexListData: ComplexList, sportId: String) -> ZSportsSlotSelectionViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportsSlotSelectionViewController.storyboardIdentifier) as! ZSportsSlotSelectionViewController
    let service = ZSportServices(apiClient: apiClient)
    viewController.viewModel = ZSportsSlotSelectionViewModel(authentication: authentication, service: service, sportCategory: sportCategory, complexListData: complexListData, sportId: sportId)
    viewController.coordinator = ZSportsSlotSelectionCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.title = "Book Sports Complex"
    return viewController
}

func zSportsReviewViewController(navigationController: UINavigationController, zSportsPaymentsInquiryData: ZSportsPaymentsInquiryResponse) -> ZSportsReviewViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportsReviewViewController.storyboardIdentifier) as! ZSportsReviewViewController
    let service = ZSportServices(apiClient: apiClient)
    viewController.viewModel = ZSportsReviewViewModel(authentication: authentication, zSportsPaymentsInquiryData: zSportsPaymentsInquiryData, service: service, orderId: zSportsPaymentsInquiryData.body?.details?.orderId ?? 0)
    viewController.coordinator = ZSportsReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.title = "Review Details"
    return viewController
}

func zSportTransferSuccessfullViewController(navigationController: UINavigationController, zSportsPaymentsPayData: ZSportsPaymentsPayResponse, isHistoryReceipt: ZSportSuccess, zSportTransferSuccessfullQRItem: ZSportTransferSuccessfullQRItem, zSportTransferSuccessfullDetail: ZSportTransferSuccessfullDetail, completion: @escaping (() -> Void)) -> ZSportTransferSuccessfullViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportTransferSuccessfullViewController.storyboardIdentifier) as! ZSportTransferSuccessfullViewController
    viewController.viewModel = ZSportTransferSuccessfullViewModel(authentication: authentication, zSportsPaymentsPayData: zSportsPaymentsPayData, isHistoryReceipt: isHistoryReceipt, slotDetails: true, zSportTransferSuccessfullQRItem: zSportTransferSuccessfullQRItem, zSportTransferSuccessfullDetail: zSportTransferSuccessfullDetail)
    viewController.coordinator = ZSportTransferSuccessfullCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.didTapClose = completion
    return viewController
}

    func zSportTransferQRSuccessfullViewController(navigationController: UINavigationController, isHistoryReceipt: ZSportSuccess, zSportTransferSuccessfullQRItem: ZSportTransferSuccessfullQRItem, zSportTransferSuccessfullDetail: ZSportTransferSuccessfullDetail, transactionId: String, completion: @escaping (() -> Void)) -> ZSportTransferQRSuccessfullViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportTransferQRSuccessfullViewController.storyboardIdentifier) as! ZSportTransferQRSuccessfullViewController
    viewController.viewModel = ZSportTransferQRSuccessfullViewModel(authentication: authentication, isHistoryReceipt: isHistoryReceipt, zSportTransferSuccessfullQRItem: zSportTransferSuccessfullQRItem, zSportTransferSuccessfullDetail: zSportTransferSuccessfullDetail, transactionId: transactionId)
    viewController.coordinator = ZSportTransferQRSuccessfullCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.didTapClose = completion
    return viewController
}

func zSportHistoryViewController(navigationController: UINavigationController) -> ZSportHistoryViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportHistoryViewController.storyboardIdentifier) as! ZSportHistoryViewController
    let ZSportService = ZSportServices(apiClient: apiClient)
    viewController.viewModel = ZSportHistoryViewModel(authentication: authentication, service: ZSportService)
    viewController.coordinator = ZSportHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
    viewController.title = "History"
    return viewController
}

func zSportsFaqsViewController(navigationController: UINavigationController) -> ZSportsFaqsViewController {
    let viewController = Storyboard.zSports.instantiateViewController(withIdentifier: ZSportsFaqsViewController.storyboardIdentifier) as! ZSportsFaqsViewController
    let ZSportService = ZSportServices(apiClient: apiClient)
    viewController.viewModel = ZSportsFaqsViewModel(authentication: authentication, faqService: ZSportService)
    viewController.coordinator = ZSportsFaqsCoordinator(navigationController: navigationController, viewControllerFactory: self)
    return viewController
}

func zSportsMapViewController(zSportsLocationItem: ZSportsLocationItem) -> ZSportsMapViewController {
    let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportsMapViewController.storyboardIdentifier) as! ZSportsMapViewController
    viewController.title = "Locate Us"
    viewController.viewModel = ZSportsMapViewModel(zSportsLocationItem: zSportsLocationItem)
    return viewController
}
    
    func virtualCardSegmentView(navigationController: UINavigationController) -> TransferMoneyViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: TransferMoneyViewController.storyboardIdentifier) as! TransferMoneyViewController
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        
        viewController.viewModel = TransferMoneyViewModel(payment: payment, mobileNo: authentication.user.mobileNumber)
        viewController.coordinator = TransferMoneyCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.viewControllerItems = [virtualCardViewController(navigationController: navigationController),virtualCardHistoryController(navigationController: navigationController)]
        viewController.title = "Virtual Card".localized
        return viewController
    }
   
    func virtualCardViewController(navigationController: UINavigationController) -> VirtualCardVC {
        let viewController = Storyboard.virtualCard.instantiateViewController(identifier: VirtualCardVC.storyboardIdentifier) as! VirtualCardVC

        let vcService = VirtualCard1Service(apiClient: apiClient)
        viewController.viewModel = VirtualCardViewModel(service: vcService, authentication: self.authentication, mobile: authentication.user.mobileNumber)
        viewController.coordinator = VirtualCardCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Virtual Card".localized
        return viewController
    }
   
    func virtualCardHistoryController(navigationController: UINavigationController) -> VirtualCardHistoryVC {
        let viewController = Storyboard.virtualCard.instantiateViewController(identifier: VirtualCardHistoryVC.storyboardIdentifier) as! VirtualCardHistoryVC
        let vcService = VirtualCard1Service(apiClient: apiClient)
        viewController.viewModel = VirtualCardHistoryViewmodel(service: vcService,mobile: authentication.user.mobileNumber)
        viewController.coordinator = VirtualCardHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "History".localized
        return viewController
    }
    
    //MARK: - Planckly
    
    func plancklyWebViewController(navigationController: UINavigationController) -> PlancklyWebViewController {
        let viewController = Storyboard.planckly.instantiateViewController(identifier: PlancklyWebViewController.storyboardIdentifier) as! PlancklyWebViewController
        viewController.viewModel = PlancklyWebViewModel(authentication: authentication)
        viewController.coordinator = PlancklyWebViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func zSportTransferQRSuccessfullViewController(navigationController: UINavigationController, isHistoryReceipt: ZSportSuccess, zSportTransferSuccessfullQRItem: ZSportTransferSuccessfullQRItem, zSportTransferSuccessfullDetail: ZSportTransferSuccessfullDetail, transactionId: String? = nil, completion: @escaping (() -> Void)) -> ZSportTransferQRSuccessfullViewController {
        let viewController = Storyboard.zSports.instantiateViewController(identifier: ZSportTransferQRSuccessfullViewController.storyboardIdentifier) as! ZSportTransferQRSuccessfullViewController
        viewController.viewModel = ZSportTransferQRSuccessfullViewModel(authentication: authentication, isHistoryReceipt: isHistoryReceipt, zSportTransferSuccessfullQRItem: zSportTransferSuccessfullQRItem, zSportTransferSuccessfullDetail: zSportTransferSuccessfullDetail, transactionId: transactionId ?? "0")
        viewController.coordinator = ZSportTransferQRSuccessfullCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.didTapClose = completion
        return viewController
    }
    
    func plancklyReviewViewController(response: PlancklyResponse, navigationController: UINavigationController) -> PlancklyReviewViewController {
        let viewController = Storyboard.planckly.instantiateViewController(identifier: PlancklyReviewViewController.storyboardIdentifier) as! PlancklyReviewViewController
        let service = PlancklyService(apiClient: apiClient)
        viewController.viewModel = PlancklyReviewViewModel(plancklyResponse: response, plancklyService: service, authentication: authentication)
        viewController.coordinator = PlancklyReviewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Review Details".localized
        return viewController
    }
    
    func plancklySuccessWebViewController(navigationController: UINavigationController) -> PlancklySuccessWebViewController {
        let viewController = Storyboard.planckly.instantiateViewController(identifier: PlancklySuccessWebViewController.storyboardIdentifier) as! PlancklySuccessWebViewController
        viewController.viewModel = PlancklySuccessWebViewModel(authentication: authentication)
        viewController.coordinator = PlancklyWebViewCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    //MARK: - ZTag
    func zTagOnBoardingViewController(navigationController: UINavigationController) -> ZTagOnBoardingViewController {
        let viewController = Storyboard.zTag.instantiateViewController(identifier: ZTagOnBoardingViewController.storyboardIdentifier) as! ZTagOnBoardingViewController
        let ZTagServices = ZTagServices(apiClient: apiClient)
        viewController.viewModel = ZTagOnBoardingViewModel(authentication: authentication, service: ZTagServices)
        viewController.coordinator = ZTagOnBoardingCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "G-Tag"
        return viewController
    }
    func zTagListViewController(navigationController: UINavigationController) -> ZTagListViewController {
        let viewController = Storyboard.zTag.instantiateViewController(identifier: ZTagListViewController.storyboardIdentifier) as! ZTagListViewController
        let zTagServices = ZTagServices(apiClient: apiClient)
        viewController.viewModel = ZTagListViewModel(authentication: authentication, service: zTagServices)
        viewController.coordinator = ZTagListCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "G-Tag"
        return viewController
    }
    
    func zTagHistoryViewController(navigationController: UINavigationController, zTagListItem: ZTagListItem) -> ZTagHistoryViewController {
        let viewController = Storyboard.zTag.instantiateViewController(identifier: ZTagHistoryViewController.storyboardIdentifier) as! ZTagHistoryViewController
        let zTagServices = ZTagServices(apiClient: apiClient)
        viewController.viewModel = ZTagHistoryViewModel(authentication: authentication, service: zTagServices, zTagListItem: zTagListItem)
        viewController.coordinator = ZTagHistoryCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "View Details"
        return viewController
    }
    func gTagHelpViewController(navigationController: UINavigationController, helpInfo: [HelpInfo]) -> GTagHelpViewController {
        let viewController = Storyboard.zTag.instantiateViewController(identifier: GTagHelpViewController.storyboardIdentifier) as! GTagHelpViewController
        let zTagServices = ZTagServices(apiClient: apiClient)
        viewController.viewModel = GTagHelpViewModel(authentication: authentication, service: zTagServices, helpInfo: helpInfo)
        viewController.coordinator = GTagHelpCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = "Help"
        return viewController
    }
    
    func gTagSheetViewController(vehicleImage: String, viewDetailImg: String, removeTagImg: String, removeTxt: String, viewDetailTxt: String, navigationController: UINavigationController) -> GTagSheetViewController {
        let viewController = Storyboard.zTag.instantiateViewController(identifier: GTagSheetViewController.storyboardIdentifier) as! GTagSheetViewController
        viewController.vehicleImage = vehicleImage
        viewController.viewDetailImg = viewDetailImg
        viewController.removeTagImg = removeTagImg
        viewController.removeTxt = removeTxt
        viewController.viewDetailTxt = viewDetailTxt
        return viewController
    }
    
    //MARK: - Payment -> MTag M-Tag
    func mTagListViewController(category: PaymentMainCategory, payload: RecentPaymentPayload? = nil, navigationController: UINavigationController) -> MTagListViewController {
        let viewController = Storyboard.payment.instantiateViewController(identifier: MTagListViewController.storyboardIdentifier) as! MTagListViewController
        viewController.payload = payload
        let paymentService = PaymentService(apiClient: apiClient)
        let paymentStorage = PaymentStorage()
        let payment = Payment(service: paymentService, storage: paymentStorage)
        let request = PaymentRequest(authentication: authentication)
        viewController.viewModel = MTagListViewViewModel(payment: payment, request: request, category: category)
        viewController.coordinator = MTagListCoordinator(navigationController: navigationController, viewControllerFactory: self)
        viewController.title = category.categoryName
        
        return viewController
    }
}

