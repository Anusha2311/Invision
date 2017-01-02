//
//  Constants.swift
//  Vesta
//
//  Created by Tejas on 3/2/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import UIKit
import Foundation

/**
 *  Global constants struct that holds all constant values
 */
struct Constants {
    
    static let EMAIL_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    static let GOOGLE_PLACES_SERVER_KEY = "AIzaSyCMjYRZ8wR2dk3XJplIjwOu3KcOSh2m0R8"
    
    
    static let ERROR_MESSAGE_DELAY = 1.75
    /**
     *  Constants for Landing Module
     */
    struct LandingConstants {
        static let BG_IMAGE_START_NUM = 1 // Starting number of image name for background
        static let BG_IMAGE_END_NUM = 6 // Ending number of image name for background
    }
    
    struct NavigationDrawerConstants {
        static let UNASSIGNED_VIEW_CONTROLLER_IDENTIFIER = "unassigned"
        static let LOGOUT_IDENTIFIER = "LogoutAction"
        static let COMMUNICATION_HUB_IDENTIFIER = "CommunicationHubViewController"
        static let CONTACT_VIEW_CONTROLLER_IDENTIFIER = "contactsViewController"
        static let OFFERS_VIEW_CONTROLLER_IDENTIFIER = "OfferDashboardViewController"
        static let PORTFOLIO_VIEW_CONTROLLER_IDENTIFIER = "PortfolioContainerViewController"
        static let HOME_VIEW_CONTROLLER_IDENTIFIER = "LandingViewController"
        static let DOCUMENT_VIEW_CONTROLLER_IDENTIFIER = "DocumentHubHomeViewController"
        static let LOGIN_VIEW_CONTROLLER = "LoginViewController"
        static let USER_PROFILE_VIEW_CONTROLLER = "UserProfileViewController"
        static let TABLE_CELL_IDENTIFIER = "NavigationDrawerTableViewCell"
        
        static let AGENT_VIEW_CONTROLLER_IDENTIFIER = "FindAgentViewController"
    }
    
    struct NumberPickerViewDataSource {
        struct LocationCriteriaDataSource {
            static let PRICE_RANGE_HEADERS = ["Min Price", "Max Price"]
            static let PRICE_RANGE_VALUES = [[0.0, 100000.0, 250000.0, 500000.0, 1500000.0, 2000000.0, 5000000.0, 10000000.0], [0.0, 100000.0, 250000.0, 500000.0, 1500000.0, 2000000.0, 5000000.0, 10000000.0]]
            static let PRICE_RANGE_SUFFIX = ""
        }
        
        struct NeighborhoodResearchDataSource {
            // Values will contain n arrays, where n is the number of headers. Each array will have 3 elements: Min, Max and Step
            // Explicit values can be given too, if the step is not constant
            static let HEADER_KEY = "headers"
            static let VALUE_KEY = "values"
            static let SUFFIX_KEY = "suffix"
            static let SCHOOL_RATING_HEADERS = ["Primary", "Jr High", "High School"]
            static let SCHOOL_RATING_VALUES = [[4.0, 8.0, 2.0], [4.0, 8.0, 2.0], [4.0, 8.0, 2.0]]
            static let SCHOOL_RATING_SUFFIX = "+"
            static let SCHOOL_RATING_TAG = 1
            static let WALK_SCORE_HEADERS = ["Walk Score"]
            static let WALK_SCORE_VALUES = [[0.0, 5.0, 1.0]]
            static let WALK_SCORE_SUFFIX = ""
            static let WALK_SCORE_TAG = 2
            static let TRANSIT_SCORE_HEADERS = ["Transit Score"]
            static let TRANSIT_SCORE_VALUES = [[0.0, 5.0, 1.0]]
            static let TRANSIT_SCORE_SUFFIX = ""
            static let TRANSIT_SCORE_TAG = 3
            static let BIKE_SCORE_HEADERS = ["Bike Score"]
            static let BIKE_SCORE_VALUES = [[0.0, 5.0, 1.0]]
            static let BIKE_SCORE_SUFFIX = ""
            static let BIKE_SCORE_TAG = 4
            static let DRIVE_SCORE_HEADERS = ["Drive Score"]
            static let DRIVE_SCORE_VALUES = [[0.0, 5.0, 1.0]]
            static let DRIVE_SCORE_SUFFIX = ""
            static let DRIVE_SCORE_TAG = 5
            static let informationDictionary = NSDictionary(dictionary: [
                String(SCHOOL_RATING_TAG):NSDictionary(objects: [SCHOOL_RATING_HEADERS, SCHOOL_RATING_VALUES, SCHOOL_RATING_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY]),
                String(WALK_SCORE_TAG):NSDictionary(objects: [WALK_SCORE_HEADERS, WALK_SCORE_VALUES, WALK_SCORE_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY]),
                String(TRANSIT_SCORE_TAG):NSDictionary(objects: [TRANSIT_SCORE_HEADERS, TRANSIT_SCORE_VALUES, TRANSIT_SCORE_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY]),
                String(BIKE_SCORE_TAG):NSDictionary(objects: [BIKE_SCORE_HEADERS, BIKE_SCORE_VALUES, BIKE_SCORE_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY]),
                String(DRIVE_SCORE_TAG):NSDictionary(objects: [DRIVE_SCORE_HEADERS, DRIVE_SCORE_VALUES, DRIVE_SCORE_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY])
                ])
        }
        
        struct PropertyResearchDataSource {
            // Values will contain n arrays, where n is the number of headers. Each array will have 3 elements: Min, Max and Step
            // Explicit values can be given too, if the step is not constant
            static let HEADER_KEY = "headers"
            static let VALUE_KEY = "values"
            static let SUFFIX_KEY = "suffix"
            static let BEDROOMS_BATHROOMS_HEADERS = ["Min Bedrooms", "Min Bathrooms"]
            static let BEDROOMS_BATHROOMS_VALUES = [[1.0, 5.0, 1.0], [1.0, 5.0, 1.0]]
            static let BEDROOMS_BATHROOMS_SUFFIX = "+"
            static let BEDROOMS_BATHROOMS_TAG = 1
            static let HOME_SIZE_HEADERS = ["Min SQFT", "Max SQFT"]
            static let HOME_SIZE_VALUES = [[0.0, 10000.0, 100.0], [0.0, 10000.0, 100.0]]
            static let HOME_SIZE_SUFFIX = "SQFT"
            static let HOME_SIZE_TAG = 3
            static let LOT_SIZE_HEADERS = ["Min Lot Size", "Max Lot Size"]
            static let LOT_SIZE_VALUES = [[0.1, 10.0, 0.1], [0.1, 10.0, 0.1]]
            static let LOT_SIZE_SUFFIX = "Acres"
            static let LOT_SIZE_TAG = 4
            static let GARAGE_HEADERS = ["Minimum"]
            static let GARAGE_VALUES = [[1.0, 5.0, 1.0]]
            static let GARAGE_SUFFIX = "+ Cars"
            static let GARAGE_TAG = 5
            static let YEAR_BUILT_HEADERS = ["Minimum"]
            static let YEAR_BUILT_VALUES = [[1945.0, 2016.0, 1.0]]
            static let YEAR_BUILT_SUFFIX = ""
            static let YEAR_BUILT_TAG = 6
            static let informationDictionary = NSDictionary(dictionary: [
                String(BEDROOMS_BATHROOMS_TAG):NSDictionary(objects: [BEDROOMS_BATHROOMS_HEADERS, BEDROOMS_BATHROOMS_VALUES, BEDROOMS_BATHROOMS_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY]),
                
                String(HOME_SIZE_TAG):NSDictionary(objects: [HOME_SIZE_HEADERS, HOME_SIZE_VALUES, HOME_SIZE_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY]),
                String(LOT_SIZE_TAG):NSDictionary(objects: [LOT_SIZE_HEADERS, LOT_SIZE_VALUES, LOT_SIZE_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY]),
                String(GARAGE_TAG):NSDictionary(objects: [GARAGE_HEADERS, GARAGE_VALUES, GARAGE_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY]),
                String(YEAR_BUILT_TAG):NSDictionary(objects: [YEAR_BUILT_HEADERS, YEAR_BUILT_VALUES, YEAR_BUILT_SUFFIX], forKeys: [HEADER_KEY, VALUE_KEY, SUFFIX_KEY])
                ])
        }
    }
    
    struct Communications{
        //conversation types
        static let COMMUNICATION_TYPE_SMS = "SMS"
        static let COMMUNICATION_NO_CONTACTS = "Please select a contact or add a phone number to send the message"
    }
    
    struct ErrorConstants {
        static let ERROR_MESSAGE_KEY = "errorMessage"
        
        struct ErrorDomains {
            static let NETWORK_ERROR = "network"
        }
        
        struct ErrorCodes {
            static let NETWORK_ERROR = 0
            static let NETWORK_UNAVAILABLE = 1
            static let NETWORK_ERROR_400 = 400
            static let NETWORK_ERROR_404 = 404
            static let NETWORK_ERROR_500 = 500
            
        }
        
        struct ErrorMessages {
            static let NETWORK_ERROR = "Something went wrong! Please try again."
            static let NETWORK_UNAVAILABLE = "Network Unavailable. Please try again."
            static let NETWORK_ERROR_400 = "Requested material not found."
            static let NETWORK_ERROR_500 = "Invalid request"
        }
    }
    
    struct UserDefaultKeys {
        
        static let FIRST_LAUNCH_KEY = "first_launch_key"
        
        static let SEARCH_QUERY_KEY = "search_query"
        static let LOCATION_CRITERIA_KEY = "location_criteria_key"
        static let NEIGHBOURHOOD_RESEARCH_KEY = "neighbourhood_research_key"
        static let NEIGHBOURHOOD_RESEARCH_SLIDER_KEY = "neighbourhood_research_slider_key"
        static let PROPERTY_RESEARCH_KEY = "property_research_key"
        static let PROPERTY_RESEARCH_SLIDER_KEY = "property_research_slider_key"
        
        static let PROPERTY_TYPE_KEY = "property_type"
        static let MIN_PRICE_KEY = "min_price"
        static let MAX_PRICE_KEY = "max_price"
        
        static let AUTH0_JWT_TOKEN_KEY = "auth0_jwt_token_key"
        static let AUTH0_REFRESH_TOKEN_KEY = "auth0_refresh_token_key"
        static let AUTH0_USER_PROFILE_KEY = "auth0_user_profile_key"
        static let IS_USER_LOGGED_IN_KEY = "is_user_logged_in_key"
        static let USER_ID = "user_id"
        static let USER_ACCOUNT_ID = "user_account_id"
        static let USER_FIRST_NAME = "user_first_name"
        static let USER_LAST_NAME = "user_last_name"
        static let USER_CELL_VERIFIED = "user_cell_verified"
        static let USER_EMAIL = "user_email"
        static let USER_EMAIL_VERIFIED = "user_email_verified"
        static let USER_STATUS = "user_status"
        static let USER_AGENT = "user_agent"
        static let USER_CONTACT = "user_cell"
        static let USER_PASSWORD = "user_password"
        static let USER_CONFIRM_PASSWORD = "user_confirm_password"
        static let USER_SYSTEM_EMAIL_ID =  "systemEmailId"
        
        
        static let EMAIL_BADGE_COUNT_KEY = "email_badge_count_key"
        static let SMS_BADGE_COUNT_KEY = "sms_badge_count_key"
        static let PHONE_BADGE_COUNT_KEY = "phone_badge_count_key"
        static let NOTIFICATION_BADGE_COUNT_KEY = "notification_badge_count_key"
        static let DELETE_BADGE_COUNT_KEY = "delete_badge_count_key"
        
        
        static let EMAIL_FILTER_KEY = "email_filter_key"
        static let SMS_FILTER_KEY = "sms_filter_key"
        static let PHONE_FILTER_KEY = "phone_filter_key"
        static let NOTIFICATION_FILTER_KEY = "notification_filter_key"
        static let DELETED_FILTER_KEY = "deleted_filter_key"
        
        static let COMMUNICATION_LAST_SYNC_TIME_KEY = "communication_last_sync_time_key"
        static let COMMUNICATION_SMS_LAST_SYNC_TIME_KEY = "communication_sms_last_sync_time_key"
        static let COMMUNICATION_CONTINUATION_TOKEN = "communication_continuation_token"
        
        static let IS_SAVE_SEARCH = "SaveSearch"
        static let SAVED_SEARCHES_ARRAY = "Saved Searches Array"
        static let SAVED_SEARCH_MODE_PREFERENCE_KEY = "search_preference_key"
        
        static let DEVICE_TOKEN_KEY = "device_token_key"
        
    }
    
    struct PropertyImages {
        static let propertyPhotos: [String] = ["REImg4.jpg", "REImg7.jpg", "REImg12.jpg", "REImg14.jpg", "REImg15.jpg", "REImg16.jpg", "REImg20.jpg", "REImg22.jpg", "REImg23.jpg", "REImg26.jpg", "REImg27.jpg", "REImg30.jpg", "REImg31.jpg",
                                               "REImg32.jpg", "REImg33.jpg", "REImg34.jpg", "REImg35.jpg", "REImg36.jpg", "REImg37.jpg", "REImg38.jpg", "REImg39.jpg",
                                               "REImg46.jpg", "REImg47.jpg", "REImg48.jpg", "REImg52.jpg", "REImg59.jpg", "REImg62.jpg", "REImg63.jpg", "REImg64.jpg", "REImg65.jpg"]
    }
    
    // Enum that holds the Document Type used by DocumentHub
    enum VestaDocumentType {
        case Directory
        case File
    }
    struct ContactsKeys {
        static let LASTSYNCTIME = "lastSyncedTime"
        static let SYNCALERTSHOWN = "hasSyncAlertShown"
        static let PRIMARYDEVICEALERTSHOWN = "hasPrimaryDeviceAlertShown"
        static let HASYNCED = "hasSyncedBefore"
        static let ISPRIMARYDEVICE = "isPrimary"
        static let SYNCENABLED = "hasSyncEnabled"
        static let INVITE_STATUS_NOT_INVITED = "Not Invited"
        static let INVITE_STATUS_PENDING = "Pending"
        static let INVITE_STATUS_BLOCKED = "Blocked"
        static let INVITE_STATUS_REJECTED = "Rejected"
        static let  DEVICE_ID = "DeviceID"
        static let ACCEPTED_CONTACT_STATUS = "Accepted"
        static let PENDING_CONTACT_STATUS = "Pending"
        static let PAGE_SIZE_CONTACTS_FETCH = 30
    }
    struct Networks {
        static let GET = "GET"
        static let POST = "POST"
        static let PUT = "PUT"
        static let DELETE = "DELETE"
        static let PATCH = "PATCH"
//        static let BASE_URL = "http://vestawcf.westus.cloudapp.azure.com/app.web/api/"
        //static let BASE_URL = "http://vestamicro.westus.cloudapp.azure.com/gateway/"
        //static let BASE_URL = "http://vestawcf.westus.cloudapp.azure.com/app.web/api/"
       // static let BASE_URL = "http://192.168.0.93/Gateway"
        static let BASE_URL = ""
//        static let BASE_URL = "http://192.168.1.28/vestagateway/"

        static let BASE_URL2 = "http://vestawcf.westus.cloudapp.azure.com/app.web/api/"
        static let AUTH0_BASE_URL = "https://vesta-poc.auth0.com/api/v2/users/"
        
        static let BASE_URL_LOCAL = "http://192.168.1.46/Vesta/api/"
        static let BASE_URL_CLOUD = "http://vestawcf.westus.cloudapp.azure.com/app.web/api/"
        static let GEOCODE_URL = "https://maps.googleapis.com/maps/api/geocode/json"
        static let GOOGLE_NEARBY_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        static let GOOGLE_DIRECTION_API_URL = "https://maps.googleapis.com/maps/api/directions/json"
        
        static let GOOGLE_PLACE_DETAIL =  "https://maps.googleapis.com/maps/api/place/details/json"

        
        struct UserExtension {
            static let BASE_USER_URL = "users/"
            static let USER_INFO = Constants.Networks.UserExtension.BASE_USER_URL + "user-info"

            static let USER_PROFILE = Constants.Networks.UserExtension.BASE_USER_URL + "profile"

            static let REGISTRATION = Constants.Networks.UserExtension.BASE_USER_URL + "registration"
            static let AUTH0_PATCH = "https://vesta-poc.auth0.com/api/v2/users/"
        }
        
        struct UserSettings {
            static let BASE_SETTINGS_URL = "users/settings"
            static let SETTINGS_INFO = Constants.Networks.UserExtension.BASE_USER_URL + "settings"
            
        }
        
        struct ContactsExtensions{
            static let BASE_CONTACT_URL = "contacts/"
            static let GET_ALL_CONTACTS = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "all"
            static let GET_FILTERED_CONTACTS = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "filtered-values?filterKey="
            static let SEARCH_CONTACTS = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "search?"
            static let SYNC =  Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "sync"
            static let SEND_INVITE = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "invites"
            static let CREATE_CONTACT = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL
            static let RESPOND_TO_INVITE = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "invite-responses"
            static let LEAD_DASHBOARD = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "lead-dashboard"
            static let LEAD_APPROVE = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "approve-leads"
            static let LEAD_DECLINE = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "decline-leads"
            static let LEAD_SPAM = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "apporveLeads"
            static let NOTES = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL
            static let TAGS = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL

            static let LEAD_QUESTIONS = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "user-lead-questions"
            static let SUBMIT_LEAD_QUESTIONS = Constants.Networks.ContactsExtensions.BASE_CONTACT_URL + "submit-user-lead-questions"
        }
        struct AgentExtension{
            static let AGENT_DASHBOARD =   "agent-dashboard/"
            static let AGENT_PIPELINE_COUNT = Constants.Networks.AgentExtension.AGENT_DASHBOARD + "intelligent-pipeline-count/"
            static let AGENT_DRILLDOWN = Constants.Networks.AgentExtension.AGENT_DASHBOARD + "intelligent-pipeline-drilldown/"
            static let CONTACT_NOW = "contact_now"
            static let SUGGESTED_PROPERTY = "suggested-property"
            static let ACTIONITEMS = "actions"
            static let TASKS = "tasks"
            static let APPOINTMENTS = "appointments"
            static let FOLLOWUPS = "followups"
            static let NEW_MATCHES = "new-matches"
            static let ACTIVE_OFFERS = "active-offers"
            static let APPT_REQUEST = "appointment-request"
        }
        
        struct  OfferExtensions {
            static let BASE_OFFER_URL = "offermanagement/"
            static let GET_DASHBOARD_DATA = Constants.Networks.OfferExtensions.BASE_OFFER_URL + "getdashboard"
            static let GET_OFFER_DETAIL =  Constants.Networks.OfferExtensions.BASE_OFFER_URL+"getpurchaseofferbyid"
            static let CHECK_FOR_OFFERS = Constants.Networks.OfferExtensions.BASE_OFFER_URL+"checkforoffers"
            static let SUBMIT_OFFER = Constants.Networks.OfferExtensions.BASE_OFFER_URL+"submitoffer"
            static let GET_MORE_OFFERS = Constants.Networks.OfferExtensions.BASE_OFFER_URL + ""
        }
        
        struct DocumentHubExtensions {
            static let BASE_DOCUMENT_URL = "documents/"
            static let BASE_DOCUMENT_URL_ROOT = "documents"
            static let DOCUMENT_GET_ALL_URL = BASE_DOCUMENT_URL + "list"
            
        }
        
        struct NeighborhoodAPI {
            static let NEIGHBORHOOD_SEARCH_URL = "neighborhooddna/search"
            static let GEOCODE_URL = "https://maps.googleapis.com/maps/api/geocode/json"
            static let NEIGHBORHOOD_DETAILS_URL = "/neighborhooddna/neighborhood/"
            
        }
        
        struct PropertyAPI {
            static let PROPERTY_LISTING_URL = "propertyListing/search"
            static let PROPERTY_LISTING_BYTAG_URL = "propertylisting/getbyselftag"
            static let PROPERTY_LISTING_BY_IDS = "propertylisting/bylistingids"
             static let PROPERTY_LISTING_BY_ID = "propertyListing/"
        }
        
        
        struct PortfolioAPI {
            static let PORTFOLIO_LISTING_URL = "portfolio/favorites"
            static let PORTFOLIO_GET_REFERRALS = "portfolio/shared"
            static let PORTFOLIO_GET_DISLIKES = "portfolio/dislikes"
            static let BASE_PORTFOLIO_URL = "portfolio"
            static let ADD_DISLIKE_PORTFOLIO = BASE_PORTFOLIO_URL + "/modify"
            static let REMOVE_FROM_PORTFOLIO = BASE_PORTFOLIO_URL + "/remove-property"
            static let SHARE_PROPERTY = BASE_PORTFOLIO_URL + "/share-property"
            static let PORTFOLIO_COMMENTS = BASE_PORTFOLIO_URL + "/comments"
            static let SAVE_COMMENT = BASE_PORTFOLIO_URL + "/add-comment"
            static let REMOVE_COMMENT = BASE_PORTFOLIO_URL + "/remove-comment"
            static let GET_CUSTOM_LOCATIONS = BASE_PORTFOLIO_URL + "/custom-locations"
            static let ADD_CUSTOM_LOCATION = BASE_PORTFOLIO_URL + "/manage-custom-locations"
        }
        
        struct CommunicationHubExtensions {
            static let BASE_COMMUNICATION_URL = "communications"
            static let GET_LATEST_COMMUNICATIONS = BASE_COMMUNICATION_URL + "/latest?lastSyncTime="
            static let FILTER_VALUE_COUNT = BASE_COMMUNICATION_URL + "/filter-values?filterKey="
            static let GET_COMMUNICATION = BASE_COMMUNICATION_URL + "?"
            static let GET_FILTERED_COMMUNICATION = BASE_COMMUNICATION_URL + "?filterKey="
            static let SEND_EMAIL = BASE_COMMUNICATION_URL + "/email"
            static let CONVERSATION_DETAIL = BASE_COMMUNICATION_URL + "/conversations"
            static let REPLY = SEND_EMAIL
            static let PHONELOG = BASE_COMMUNICATION_URL + "/phonelog"
            static let COMMUNICATION_UNREAD_COUNT = BASE_COMMUNICATION_URL + "/unread"
            
            static let GET_COMMUNITCATION_CONTINUATION = BASE_COMMUNICATION_URL + "?"
            //SMS related APIs
            static let SEND_SMS = BASE_COMMUNICATION_URL + "/sms"
            static let SEND_SMS_REPLY = SEND_SMS + "/reply"
        }
        
        struct DeviceExtension{
            static let BASE_COMMUNICATION_URL = "devices"
        }
        
        struct SavedSearchExtensions{
            static let GET_ALL = "searchhistory"
            static let DELETESEARCH = "searchhistory/"
            static let SUGGEST_SEARCH = "/suggest-search"
            static let GET_SAVED_SEARCHES_FOR_USER = "searchhistory/savedsearches/"
        }
        
        struct Agent {
            static let AGENT_URL = "agent-management/"
            static let AGENT_SEARCH_PARAM = Constants.Networks.Agent.AGENT_URL + "agent-search-param"
            static let SEARCH_AGENTS = Constants.Networks.Agent.AGENT_URL + "search-agents"
        }
    }
    struct ParseConstants {
        static let DEFAULT_NUMBER = -1
        //static let DEFAULT_DATE = Utils.defaultDate()
        static let DEFAULT_STRING = ""
        static let DEFAULT_BOOL = false
        static let DEFAULT_DATA = NSData()
    }
    
    struct SyncOperations {
        
        static let Deleted = "deleted"
        static let Created = "created"
        static let Updated = "updated"
    }
    
    struct ManagedObjectClassName{
        static let CONTACT = "Contact"
        static let CONVERSATION_ENTITY = "ConversationEntity"
        static let COMMUNICATION_ENTITY = "CommunicationEntity"
        static let COMMUNICATION_USER_ENTITY = "CommunicationUserEntity"
        static let EMAIL_DETAIL_ENTITY = "EmailDetailEntity"
        static let SMS_DETAIL_ENTITY = "SMSDetailEntity"
        static let PHONE_LOG_DETAIL_ENTITY = "PhoneLogDetailEntity"
        static let SEARCH_PREFERENCE = "SerachPreferenceWithName"
        static let ASSIGNED_PROPERTY_ENTITY = "AssignedPropertyEntity"
        static let NOTIFICATIONS_DETAIL_ENTITY = "NotificationsDetailEntity"
        static let NOTIFICATIONS_ACTIONS_ENTITY = "NotificationActionsEntity"
        
    }
    
    struct AmenitiesDictionary {
        static let dictionary:[Int:String] = [
            0 : "restaurant",
            1 : "shopping_mall",
            2 : "gym",
            3 : "bar",
            4 : "grocery_or_supermarket",
            5 : "place_of_worship"
        ]
    }
    
    struct ComparePropertyArrowTags {
        static let TAG_PRICE_ARROW = 1
        static let TAG_BED_ARROW = 2
        static let TAG_BATH_ARROW = 3
        static let TAG_SQFT_ARROW = 4
        static let TAG_LOT_SIZE_ARROW = 5
        static let TAG_GARAGE_SIZE_ARROW = 6
        static let TAG_YEAR_BUILT_ARROW = 7
        static let TAG_SCHOOL_ARROW = 8
        static let TAG_WALK_SCORE_ARROW = 9
        static let TAG_TRANSIT_ARROW = 10
        static let TAG_BIKE_ARROW = 11
        static let TAG_CRIME_ARROW = 12
    }
    
    struct ComparePropertyLabelTags {
        static let TAG_PRICE_LABEL = 21
        static let TAG_BED_LABEL = 22
        static let TAG_BATH_LABEL = 23
        static let TAG_SQFT_LABEL = 24
        static let TAG_LOT_SIZE_LABEL = 25
        static let TAG_GARAGE_SIZE_LABEL = 26
        static let TAG_YEAR_BUILT_LABEL = 27
        static let TAG_SCHOOL_LABEL = 28
        static let TAG_WALK_SCORE_LABEL = 29
        static let TAG_TRANSIT_LABEL = 30
        static let TAG_BIKE_LABEL = 31
        static let TAG_CRIME_LABEL = 32
    }
    
    struct CompareNeighborhoodArrowTags {
        static let TAG_ACTIVE_LISTINGS = 1
        static let TAG_LISTINGS_RANGE = 2
        static let TAG_AVG_LIST_PRICE = 3
        static let TAG_AVG_DOM = 4
        static let TAG_DISTRESSED_SALES = 5
        static let TAG_SQFT_RANGE = 6
        static let TAG_AVG_SQFT = 7
        static let TAG_AVG_PRICE_PERSQFT = 8
        static let TAG_LOT_SIZE = 9
        static let TAG_POPULATION = 10
        static let TAG_SCHOOL = 11
        static let TAG_WALK_SCORE = 12
        static let TAG_TRANSIT_SCORE = 13
        static let TAG_BIKE_SCORE = 14
        static let TAG_DRIVE_SCORE = 15
        static let TAG_CRIME_SCORE = 16
        
    }

    
    struct CompareNeighborhoodLabelTags {
        static let TAG_ACTIVE_LISTINGS = 21
        static let TAG_LISTINGS_RANGE = 22
        static let TAG_AVG_LIST_PRICE = 23
        static let TAG_AVG_DOM = 24
        static let TAG_DISTRESSED_SALES = 25
        static let TAG_SQFT_RANGE = 26
        static let TAG_AVG_SQFT = 27
        static let TAG_AVG_PRICE_PERSQFT = 28
        static let TAG_LOT_SIZE = 29
        static let TAG_POPULATION = 30
        static let TAG_SCHOOL = 31
        static let TAG_WALK_SCORE = 32
        static let TAG_TRANSIT_SCORE = 33
        static let TAG_BIKE_SCORE = 34
        static let TAG_DRIVE_SCORE = 35
        static let TAG_CRIME_SCORE = 36
        
    }
    
    struct MakeOfferTVCHeight {
        static let BUYER_WITHOUT_COBUYER_BUTTON_TVC_HEIGHT: CGFloat = 295
        static let BUYER_WITH_COBUYER_BUTTON_TVC_HEIGHT:CGFloat = 327
        static let LENDER_TVC_HEIGHT_DEFAULT: CGFloat = 384
        static let LENDER_TVC_HEIGHT: CGFloat = 95
        static let BUYER_AGENT_TVC_HEIGHT: CGFloat = 430
        static let BUYER_AGENT_TVC_HEIGHT_NON_EDIT_MODE : CGFloat = 430 - 48 //hiding In-Address Book option
        static let OFFER_DOC_DEFAULT_SPACE_HEIGHT:CGFloat = 87
        static let OFFER_DOC_SIGLE_TVC_HEIGHT:CGFloat = 60
        static let OFFER_DETAILS_TVC_HEIGHT: CGFloat = 584 - 48 + (48 * 7) // Removed Prequalified from offer details, added 7 more fields
        static let OFFER_DETAILS_TVC_HEIGHT_WITHOUT_SELLER_CONCESSIONS : CGFloat = MakeOfferTVCHeight.OFFER_DETAILS_TVC_HEIGHT - (48*5)
        static let CO_BUYER_TVC_HEIGHT : CGFloat = 241
        //        static let OFFER_DOC_DEFAULT_SPACE_HEIGHT_NON_EDIT: CGFloat = 87 - 40
    }
    
    struct QuestionnaireOptionsTVC {
        static let QUESTION_TEXT_HEIGHT: CGFloat = 20
        static let OPTIONS_CONTAINER_VIEW_HEIGHT: CGFloat = 40
        static let INTERSPACE: CGFloat = 4
        static let PADDING: CGFloat = 8
    }
    
    struct PortfolioEmptyDataSourceStrings {
        static let EMPTY_FAVORITES_STRING = "No Favorites Added. Add Properties to Favorites by using the star icon on the property listings"
        static let EMPTY_SHARED_STRING = "You have no shared properties"
        static let EMPTY_DISLIKED_STRING = "You havent disliked any properties"
        
    }
    enum CommunicationFilterType: String {
        case Name = "name"
        case Role = "role"
        case Property = "property"
    }
    
    struct PropertyDetailsCellHeight {
        static let COMMENTS_CELL_HEIGHT_DEFAULT: CGFloat = 64 //includes: comment top padding: 16, comment bottom padding: 8, Comment made by view: 32, view botton padding: 8
        static let COMMENT_LABEL_DEFAULT_HEIGHT:CGFloat = 16
        static let INFO_CELL_PADDING: CGFloat = 8 + 8
        static let SHARE_CELL_HEIGHT_DEFAULT: CGFloat = 44
        static let IMAGE_COLLECTION_VIEW_HEIGHT: CGFloat = 58 + 16 //(8 : top padding, 8: bottom padding)
        static let COLLECTION_VIEW_CELL_SIZE: CGFloat = 58
        static let SUBHEADER_HEIGHT: CGFloat = 35
        static let ADD_COMMENT_BUTTON_HEIGHT_WITH_PADDING: CGFloat = 35 + 8 //button + bottom padding
        static let ADD_COMMENT_BUTTON_HEIGHT: CGFloat = 35
        
        
    }
    
    struct PropertyDetailsStaticString {
        static let NO_COMMENT_TEXT = "When you add a property to your portfolio or share it with your contacts, you can type in a note or upload a photo to remember why you liked or disliked a property.  People you share properties with will also be able to make comments and upload photos.\n\nThis section will display comments/photos and allow you to take your notes and collaborate with anyone you like."
    }
    
    struct CustomLocation {
        static let UPDATE_CUSTOM_LOCATIONS_NOTIFICATION = "update_custom_location"
    }
    
    struct OfferDetails {
        struct DateFormat {
            static let OfferExpire_DateFormat = "MM/dd/yyyy HH:mm:ss"
            static let OfferClosing_DateFormat_Received = "MM/dd/yyyy HH:mm:ss"
            static let OfferClosing_DateFormat = "MM/dd/yyyy"
            static let OfferDate_DateFormat = "MM/dd/yyyy HH:mm:ss"
        }
        struct Notification {
            static let OFFER_DASHBOARD_UPDATE_NOTIFICATION = "update_offer_dashboard"
        }
    }
    
    struct SignUpConstants {
        
        struct SignUpValidationMessages {
            static let EMAIL_EMPTY = "Email cannot be empty"
            static let EMAIL_INVALID = "Enter valid email"
            static let PASSWORD_EMPTY = "Password cannot be empty"
            static let CONFIRM_PASSWORD_EMPTY = "Confirm Password cannot be empty"
            static let FIRST_NAME_EMPTY = "First name cannot be empty"
            static let LAST_NAME_EMPTY = "Last name cannot be empty"
            static let PASSWORD_MATCH_FAIL = "Password and confirm password do not match"
        }
        
        struct SignUpKeyConstants {
            static let EMAIL = "email"
            static let PASSWORD = "password"
            static let CONFIRM_PASSWORD = "confirmPassword"
            static let FIRST_NAME = "firstName"
            static let LAST_NAME = "lastName"
            static let CONTACT = "contact"
        }
        
        static let EMAIL_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    }
    
    
    struct SocialLoginConstants {
        
        static let CONNECTION_NAME_GOOGLE = "google-oauth2"
        
        
    }
    
    //Constant for Grand Dispatch Queue
    static var GlobalMainQueue: dispatch_queue_t {
        return dispatch_get_main_queue()
    }
    
    static var GlobalUserInteractiveQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
    }
    
    static var GlobalUserInitiatedQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
    }
    
    static var GlobalUtilityQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
    }
    
    static var GlobalBackgroundQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
    }
    
    
}
