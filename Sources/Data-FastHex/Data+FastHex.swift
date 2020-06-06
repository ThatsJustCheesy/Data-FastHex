// This file © 2020 Ian Gregory, licensed under the MIT License.
// Original library © 2015 Jonathan Mah, licensed under the MIT License.

import Foundation
import Data_FastHex_ObjC

// PERFORMANCE NOTE: For maximal performance, deal in `NSData` and use the `NSData`
// extensions, since they can directly call the Objective-C extensions.

// MARK: Data extensions
extension Data {
	
	/**
		Initializes by parsing hex data from `hexString`.
		Non-hex characters in the string are ignored.
		Equivalent to `Data(hexString: hexString, ignoreOtherCharacters: true)`.
	*/
	public init(hexString: String) {
		self = NSData(hexString: hexString) as Data
	}
	
	/**
		Initializes by parsing hex data from `hexString`.
		- Parameters:
			- hexString: The string containing hexidecimal characters, e.g., "F00".
						 May have uppercase and lowercase letters, e.g., "dEAdbEEf".
			- ignoreOtherCharacters: Whether non-hex characters in the string are ignored.
									 If this is `false`, then the `init` fails (resulting in `nil`)
									 if `hexString` contains any non-hex (`[0-9A-Fa-f]`) characters.
	*/
	public init?(hexString: String, ignoreOtherCharacters: Bool) {
		if let nsdata = NSData(hexString: hexString, ignoreOtherCharacters: ignoreOtherCharacters) {
			self = nsdata as Data
		} else {
			return nil
		}
	}
	
	/// The data, represented by an uppercase hex string (0–9 and A–F).
	public var hexStringRepresentation: String {
		(self as NSData).hexStringRepresentation()
	}
	
	/// The data, represented by an uppercase hex string (0–9 and A–F).
	public var uppercaseHexStringRepresentation: String {
		(self as NSData).hexStringRepresentationUppercase(true)
	}
	
	/// The data, represented by a lowercase hex string (0–9 and a–f).
	public var lowercaseHexStringRepresentation: String {
		(self as NSData).hexStringRepresentationUppercase(false)
	}
	
}

// MARK: NSData extensions
// PERFORMANCE NOTE: For maximal performance, deal in `NSData` and use these
// extensions, since they can directly call the Objective-C extensions.
extension NSData {
	
	/**
		Initializes by parsing hex data from `hexString`.
		Non-hex characters in the string are ignored.
		Equivalent to `NSData(hexString: hexString, ignoreOtherCharacters: true)`.
	*/
	// Declared in Objective-C:
	// public init(hexString: String)
	
	/**
		Initializes by parsing hex data from `hexString`.
		- Parameters:
			- hexString: The string containing hexidecimal characters, e.g., "F00".
						 May have uppercase and lowercase letters, e.g., "dEAdbEEf".
			- ignoreOtherCharacters: Whether non-hex characters in the string are ignored.
									 If this is `false`, then the `init` fails (resulting in `nil`)
									 if `hexString` contains any non-hex (`[0-9A-Fa-f]`) characters.
	*/
	// Declared in Objective-C:
	// public init?(hexString: String, ignoreOtherCharacters: Bool)
		
	/// The data, represented by an uppercase hex string (0–9 and A–F).
	// Declared in Objective-C:
	// public func hexStringRepresentation() -> String
		
	/// The data, represented by a hex string whose case depends on the
	/// `uppercase` parameter; when `uppercase is `true`, contains 0–9 and A–F;
	/// otherwise, contains 0–9 and a–f.
	// Declared in Objective-C:
	// public func hexStringRepresentationUppercase(_ uppercase: Bool) -> String
	
	/// The data, represented by an uppercase hex string (0–9 and A–F).
	public var hexStringRepresentation: String {
		hexStringRepresentation()
	}
	
	/// The data, represented by an uppercase hex string (0–9 and A–F).
	public var uppercaseHexStringRepresentation: String {
		hexStringRepresentationUppercase(true)
	}
	
	/// The data, represented by a lowercase hex string (0–9 and a–f).
	public var lowercaseHexStringRepresentation: String {
		hexStringRepresentationUppercase(false)
	}
	
}
