import requests

def extract_address_dict(address):
    # Extract the address dictionary from the address. This function makes sure that pincode and address is split. 
    parts = address.split()
    pin_code = None
    for part in reversed(parts):
        if part.isdigit() and len(part) == 6:
            pin_code = part
            break
    address_dict = {part: None for part in parts if part != pin_code}
    return pin_code, address_dict

def check_post_office(pin_code, address_dict):
    # Use the Postal PIN Code API to verify the PIN code
    api_url = f"http://www.postalpincode.in/api/pincode/{pin_code}"
    response = requests.get(api_url)

    if response.status_code == 200:
        data = response.json()
        if data and data['Status'] == 'Success':
            post_office_data = data['PostOffice']
            for office in post_office_data:
                post_office_name = office['Name'].lower()
                for key in address_dict:
                    if key.lower() in post_office_name:
                        return True
            return False  # Return False if none of the keys match the post office name
    return False

def main():
    address = input("Enter the free-flowing address: ")
    pin_code, address_dict = extract_address_dict(address)

    if pin_code:
        is_valid_post_office = check_post_office(pin_code, address_dict)
        if is_valid_post_office:
            print("PIN code is correct and matches the address elements.")
        else:
            print("PIN code is incorrect for the provided address elements.")
    else:
        print("No valid PIN code found in the address.")

if __name__ == "__main__":
    main()
