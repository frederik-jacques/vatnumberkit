//
//  VatNumberKit_ChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 03/02/2023.
//

import Foundation

extension VatNumberKit {
        
    struct ChecksumValidator {
        
        public static func validate(rawVatNumber: String?) -> Bool {
            guard let vatNumber = VatNumber(rawVatNumber: rawVatNumber) else { return false }
            
            switch vatNumber.country {
            case .austria:                
                return AustriaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .belgium:
                return BelgiumChecksumValidator.validate(vatNumber: vatNumber)
                
            case .bulgaria:
                return BulgariaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .croatia:
                return CroatiaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .cyprus:
                return CyprusChecksumValidator.validate(vatNumber: vatNumber)
                
            case .czechRepublic:
                return CzechRepublicChecksumValidator.validate(vatNumber: vatNumber)
                
            case .denmark:
                return DenmarkChecksumValidator.validate(vatNumber: vatNumber)
                
            case .estonia:
                return EstoniaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .europeanEntity:
                return EuropeanEntityChecksumValidator.validate(vatNumber: vatNumber)
                
            case .finland:
                return FinlandChecksumValidator.validate(vatNumber: vatNumber)
                
            case .france:
                return FranceChecksumValidator.validate(vatNumber: vatNumber)
                
            case .germany:
                return GermanyChecksumValidator.validate(vatNumber: vatNumber)
                
            case .greatBritain:
                return GreatBritainChecksumValidator.validate(vatNumber: vatNumber)
                
            case .greece:
                return GreeceChecksumValidator.validate(vatNumber: vatNumber)
                
            case .hungary:
                return HungaryChecksumValidator.validate(vatNumber: vatNumber)
                
            case .ireland:
                return IrelandChecksumValidator.validate(vatNumber: vatNumber)
                
            case .italy:
                return ItalyChecksumValidator.validate(vatNumber: vatNumber)
                
            case .latvia:
                return LatviaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .lithuania:
                return LithuaniaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .luxembourg:
                return LuxembourgChecksumValidator.validate(vatNumber: vatNumber)
                
            case .malta:
                return MaltaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .netherlands:
                return NetherlandsChecksumValidator.validate(vatNumber: vatNumber)
                
            case .northernIreland:
                return NorthernIrelandChecksumValidator.validate(vatNumber: vatNumber)
                
            case .poland:
                return PolandChecksumValidator.validate(vatNumber: vatNumber)
                
            case .portugal:
                return PortugalChecksumValidator.validate(vatNumber: vatNumber)
                
            case .romania:
                return RomaniaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .slovakia:
                return SlovakiaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .slovenia:
                return SloveniaChecksumValidator.validate(vatNumber: vatNumber)
                
            case .spain:
                return SpainChecksumValidator.validate(vatNumber: vatNumber)
                
            case .sweden:
                return SwedenChecksumValidator.validate(vatNumber: vatNumber)
            }
        }
        
    }
    
}
