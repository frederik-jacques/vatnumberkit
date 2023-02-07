<p align="center">
<img src="https://getbillie.app/wp-content/uploads/vatnumberkit_logo.png" width="400px" height="537px" alt="VatNumberKit Logo" />
</p>

VatNumberKit is a Swift library to check and validate VAT numbers (checksum based & online government services) on both iOS and macOS.

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ffrederik-jacques%2Fvatnumberkit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/frederik-jacques/vatnumberkit)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Ffrederik-jacques%2Fvatnumberkit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/frederik-jacques/vatnumberkit)

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Supported countries](#supported-countries)
- [Credits](#credits)
- [License](#license)

## Requirements

- iOS 14.0+ / macOS 12+
- Xcode 11.0+
- Swift 5.0+

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 11+ is required to build VatNumberKit using Swift Package Manager.

To integrate VatNumberKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/frederik-jacques/vatnumberkit.git", .upToNextMajor(from: "0.1.0"))
]
```

### Manually

If you prefer not to use Swift Package Manager, you can integrate VatNumberKit into your project manually.

---

## Usage

### Validate the VAT number format

Use the static method `VatNumberKit.validateFormat(vatNumber:)` to check if the VAT number format is valid.

The result of this call returns a `VatNumberKit.ValidationOutput` object which has the following properties.

* vatNumber: A `VatNumber` object (with country information)
* isValid: Is the format valid

#### Example

```swift
import VatNumberKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let validationOutput = VatNumberKit.validateFormat(vatNumber: "BE0651634023"), validationOutput.isValid {
            print("The VAT number has a valid format")
        }
        
    }
}

```

### Validate the VAT checksum

Use the static method `VatNumberKit.validateChecksum(vatNumber:)` to check if the checksum for the given VAT number is valid.

The result of this call returns a `Boolean`, indicating if the checksum is correct.

#### Example

```swift
import VatNumberKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if VatNumberKit.validateChecksum(vatNumber: "BE0651634023"){
            print("The VAT number has a valid checksum")
        }
        
    }
}

```


### Online VAT number validation
VatNumberKit also allows you to validate a VAT number against 2 online services.
*  European VAT numbers: Uses the VIES API of the [European Union](https://ec.europa.eu/taxation_customs/vies/#/vat-validation)
* Great Britain VAT numbers: Uses the API of the [UK Gov](https://www.gov.uk/check-uk-vat-number)

Use the static method `VatNumberKit.validateOnline(vatNumber:completionHandler:)` to use the online validation. 

VatNumberKit will automatically select the correct service, based on the country code.

#### Example
```swift
VatNumberKit.validateOnline(vatNumber: "GB835145337") { result in
    switch result {
    case .success(let validation):
        if validation.isValid {
            // Retrieve the meta data for this VAT number (name & address)
            // Metadata is not always available.
            if let metaData = validation.metaData {
                print("§§ Name - \(metaData.name)")
                print("§§ Address - \(metaData.address)")
            }
        }
        else {
            print("§§ VAT number is not valid")
        }
        
    case .failure(let error):
        print("Error validating number")
        if let validationError = error as? VatNumberKit.ValidationServiceError {
            switch validationError {
            case .invalidUrl:
                print("The request url was not valid")
                
            case .invalidJsonResponse:
                print("The json returned from the service is invalid")
                
            case .invalidUrlResponse:
                print("The response returned from the service is invalid")
                
            case .validationServiceDown:
                print("The validation services is down")
                
            case .vatNumberHasIncorrectNumberOfDigits:
                print("The supplied VAT number has an incorrect number of digits (UK service only)")
                
            case .vatNumberDoesNotMatchRegisteredCompany:
                print("The supplied VAT number does not match a registered company (UK service only)")                        
            }
        }
        else {
            // Regular error
        }
    }
```

## Supported Countries

| Country          	| Offline format validation (regex) 	| Offline checksum validation 	| Online validation 	|
|------------------	|-----------------------------------	|-----------------------------	|-------------------	|
| Austria          	| ✅                                 	| ✅                           	| ✅                 	|
| Belgium          	| ✅                                 	| ✅                           	| ✅                 	|
| Bulgaria         	| ✅                                 	| ✅                           	| ✅                 	|
| Croatia          	| ✅                                 	| ✅                           	| ✅                 	|
| Cyprus           	| ✅                                 	| ✅                           	| ✅                 	|
| Czech Republic   	| ✅                                 	| ✅                           	| ✅                 	|
| Denmark          	| ✅                                 	| ✅                           	| ✅                 	|
| Estonia          	| ✅                                 	| ✅                           	| ✅                 	|
| European Entity  	| ✅                                 	| ✅                           	| ✅                 	|
| Finland          	| ✅                                 	| ✅                           	| ✅                 	|
| France           	| ✅                                 	| ✅                           	| ✅                 	|
| Germany          	| ✅                                 	| ✅                           	| ✅                 	|
| Great Britain    	| ✅                                 	| ✅                           	| ✅                 	|
| Greece           	| ✅                                 	| ✅                           	| ✅                 	|
| Hungary          	| ✅                                 	| ✅                           	| ✅                 	|
| Ireland          	| ✅                                 	| ✅                           	| ✅                 	|
| Italy            	| ✅                                 	| ✅                           	| ✅                 	|
| Latvia           	| ✅                                 	| ✅                           	| ✅                 	|
| Lithuania        	| ✅                                 	| ✅                           	| ✅                 	|
| Luxembourg       	| ✅                                 	| ✅                           	| ✅                 	|
| Malta            	| ✅                                 	| ✅                           	| ✅                 	|
| The Netherlands  	| ✅                                 	| ✅                           	| ✅                 	|
| Northern Ireland 	| ✅                                 	| ✅                           	| ✅                 	|
| Poland           	| ✅                                 	| ✅                           	| ✅                 	|
| Portugal         	| ✅                                 	| ✅                           	| ✅                 	|
| Romania          	| ✅                                 	| ✅                           	| ✅                 	|
| Slovakia         	| ✅                                 	| ✅                           	| ✅                 	|
| Slovenia         	| ✅                                 	| ✅                           	| ✅                 	|
| Spain            	| ✅                                 	| ✅                           	| ✅                 	|
| Sweden           	| ✅                                 	| ✅                           	| ✅                 	|

Feel free to open a PR to add other countries!

## Credits

- Frederik Jacques ([@thenerd_be](https://twitter.com/thenerd_be))


## License

VatNumberKit is released under the MIT license. See LICENSE for details.
