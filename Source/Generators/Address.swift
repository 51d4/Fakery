public class Address: Generator
{
    public class func city() -> String
    {
        return generate("address.city")
    }

    public class func streetName() -> String
    {
        return generate("address.street_name")
    }

    public class func secondaryAddress() -> String
    {
        return numerify(generate("address.secondary_address"))
    }

    public class func streetAddress(includeSecondary: Bool = false) -> String
    {
        var streetAddress = numerify(generate("address.street_address"))
        if includeSecondary {
            streetAddress += " " + secondaryAddress()
        }
        return streetAddress
    }

    public class func buildingNumber() -> String
    {
        return bothify(generate("address.building_number"))
    }

    public class func postcode(stateAbbreviation: String = "") -> String
    {
        if stateAbbreviation.isEmpty {
            return bothify(generate("address.postcode"))
        }
        return bothify(generate("address.postcode_by_state.\(stateAbbreviation)"))
    }

    public class func timeZone() -> String
    {
        return generate("address.time_zone")
    }
}
