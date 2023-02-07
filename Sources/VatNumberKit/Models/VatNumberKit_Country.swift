//
//  VatNumberKit_Country.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public extension VatNumberKit {
    
    enum Country: String, CaseIterable, Hashable {
        
        case austria = "AT"
        case belgium = "BE"
        case bulgaria = "BG"
        case croatia = "HR"
        case cyprus = "CY"
        case czechRepublic = "CZ"
        case denmark = "DK"
        case estonia = "EE"
        case europeanEntity = "EU"
        case finland = "FI"
        case france = "FR"
        case germany = "DE"
        case greatBritain = "GB"
        case greece = "EL"
        case hungary = "HU"
        case ireland = "IE"
        case italy = "IT"
        case latvia = "LV"
        case lithuania = "LT"
        case luxembourg = "LU"
        case malta = "MT"
        case netherlands = "NL"
        case northernIreland = "XI"
        case poland = "PL"
        case portugal = "PT"
        case romania = "RO"
        case slovakia = "SK"
        case slovenia = "SI"
        case spain = "ES"
        case sweden = "SE"
        
        public var isGreatBritain: Bool { self == .greatBritain }        
        public var isBelgian: Bool { self == .belgium }
        
        /// Get the country based on the VAT number
        /// - Parameter vatNumber: The VAT number
        /// - Returns: The country, returns nil if the first two letters don't match a country id
        public static func create(from vatNumber: String) -> Country? {
            let countryPrefix = vatNumber.prefix(2).uppercased()
            return Country(rawValue: countryPrefix)
        }
        
        public var regexPatterns: [String] {
            switch self {
            case .austria:
                // 'AT' + 'U' + 8 digits
                // Example: ATU12345678
                return ["(AT)(U{1}\\d{8})"]
                
                // 'BE' + 10 digits
                // Belgian VAT numbers can also have 9 digits, then we have to prefix the number with a 0.
                // Examples:
                // - BE123456789
                // - BE0123456789
            case .belgium:
                return [
                    "(BE)\\s?(0?\\d{3}).?(\\d{3}).?(0?\\d{3})",
                ]
                
            case .bulgaria:
                // 'BG' + 9–10 digits
                // Examples:
                // - BG123456789
                // - BG0123456789
                return ["(BG)(\\d){9,10}"]
                
            case .croatia:
                // 'HR' + 11 digits (utilising ISO 7064, MOD 11-10)
                // Example: HR12345678901
                return ["(HR)(\\d){11}"]
                
            case .cyprus:
                // 'CY' + 9 characters (the last character must always be a letter)
                // Example: CY12345678X
                return ["(CY)(\\d){8}([A-Za-z]){1}"]
                
            case .czechRepublic:
                // 'CZ' + 8-10 digits
                // 2 types:
                //  - Business: 8 digits
                //  - Individuals:
                //      * 9 digits
                //      * 9 digits (special case), starts with 6
                //      * 10 digits
                
                // Example: CZ123456789
                return [
                    "(CZ)\\d{8}",
                    "(CZ)[0-5][0-9][0|1|5|6][0-9][0-3][0-9]\\d{3}",
                    "(CZ)6\\d{8}",
                    "(CZ)\\d{2}[0-3|5-8][0-9][0-3][0-9]\\d{4}"
                ]
                
            case .denmark:
                // 'DK' + 8 digits
                // Example: DK12345678
                return ["(DK)(\\d){8}"]
                
            case .estonia:
                // 'EE' + 9 digits
                // Example: EE123456789
                return ["(EE)(\\d){9}"]
                
            case .europeanEntity:
                // 'EU' + 9 digits
                // Example: EU123456789
                return ["(EU)(\\d){9}"]
                
            case .finland:
                // 'FI' + 8 digits
                // Example: FI12345678
                return ["(FI)(\\d){8}"]
                
            case .france:
                // 'FR' + 11 digits
                // Example: FR12345678901
                return ["(FR)[0-9A-Z]{2}[0-9]{9}"]
                
            case .germany:
                // 'DE' + 9 digits
                // Example: DE999999999
                return ["(DE)(\\d){9}"]
                
            case .greatBritain:
                // 'GB' + 9 or 12 digits
                // GB has 4 different VAT formats:
                // - 1: Standard: 9 digits
                // - 2: Branches: 12 digits
                // - 3: Goverment: GD + 3 digits
                // - 3: Health Authority: HA + 3 digits
                //
                // Examples:
                // - GB123456789
                // - GB123456789012
                // - GBGD001
                // - GBHA500
                return [
                    "(GB)(\\d{9})",
                    "(GB)(\\d{12})",
                    "(GB)(GD\\d{3})",
                    "(GB)(HA\\d{3})"
                ]
                
            case .greece:
                // 'EL or GR' + 9 digits
                // Example: EL123456789
                return ["(EL|GR)[\\d]{9}"]
                
            case .hungary:
                // 'HU' + 8 digits
                // Example: HU12345678
                return ["(HU)[\\d]{8}"]
                
            case .ireland:
                // 'IE' + 8 or 9 characters.
                // Includes one or two alphabetical characters (last, or second and last, or last 2).
                // Examples:
                // - IE1234567X
                // - IE1X23456X
                // - IE1234567XX
                // - IE1234567XX

                return [
                    "(IE)(\\d{7}[A-W]{1})",
                    "(IE)([7-9][A-Z\\*\\+)]\\d{5}[A-W])",
                    "(IE)(\\d{7})[A-W][AH]"
                ]
                
            case .italy:
                // 'IT' + 11 digits
                // Example: IT12345678911
                return ["(IT)(\\d){11}"]
                
            case .latvia:
                // 'LV' + 11 digits
                // Example: LV12345678911
                return ["(LV)(\\d){11}"]
                
            case .lithuania:
                // 'LT' + 9 or 12 digits
                // Example: LT123456789, LT123456789111
                return ["(LT)(\\d{12}|\\d{9})"]
                
            case .luxembourg:
                // 'LU' + 8 digits
                // Example: LU12345678
                return ["(LU)(\\d{8})"]
                
            case .malta:
                // 'MT' + 8 digits
                // Example: MT12345678
                return ["(MT)(\\d{8})"]
                
            case .netherlands:
                // 'NL' + 9 digits + B + 2-digit company index
                // Example: NL999999999B01
                return ["(NL)(\\d{9}B\\d{2})"]
                
            case .northernIreland:
                // 'XI' + 9 digits (introduced after Brexit)
                // Example: XI123456789
                return ["(XI)(\\d{9})",
                        "(XI)(\\d{12})",
                        "(XI)(GD\\d{3})",
                        "(XI)(HA\\d{3})"
                ]
                
            case .poland:
                // 'PL' + 10 digits
                // Example: PL0123456789
                return ["(PL)(\\d{10})"]
                
            case .portugal:
                // 'PT' + 9 digits
                // Example: PT123456789
                return ["(PT)(\\d{9})"]
                
            case .romania:
                // 'RO' + 10 digits
                // Example: RO1234567891
                return ["(RO)(\\d{10})"]
                
            case .slovakia:
                // 'SK' + 10 digits
                // Example: SK1234567891
                return ["(SK)(\\d{10})"]
                
            case .slovenia:
                // 'SI' + 8 digits
                // Example: SI12345678
                return ["(SI)(\\d{8})"]
                
            case .spain:
                // 'ES' + 1 digit or letter + 7 digits + 1 digit or letter
                // Spain has 4 different VAT formats:
                // - 1: National juridical entities
                // - 2: Other juridical entities
                // - 3: Personal entities, type 1
                // - 4: Personal entities, type 2
                // Example: ESX12345678, ES12345678X, ESX1234567X
                return [
                    "(ES)([A-Z]\\d{8})",
                    "(ES)([A-HN-SW]\\d{7}[A-J])",
                    "(ES)([0-9YZ]\\d{7}[A-Z])",
                    "(ES)([KLMX]\\d{7}[A-Z])"
                ]
                
            case .sweden:
                // 'SE' + 12 digits
                // Example: SE123456789111
                return ["(SE)(\\d){12}"]
                
            }
        }
    }
    
}
