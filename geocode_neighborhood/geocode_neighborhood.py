# cat DATA.lst | python geocode_neighborhood.py
import requests


GEOCODING_ENDPOINT = 'https://www.portlandmaps.com/arcgis/rest/services/Public/Address_Geocoding_PDX/GeocodeServer/findAddressCandidates'
NEIGHBORHOOD_ENDPOINT = 'https://www.portlandmaps.com/arcgis/rest/services/Public/COP_OpenData/MapServer/125/query'


def get_coordinates(address):
    params = {
        'Single Line Input': address,
        'f': 'json'
    }
    response = requests.get(GEOCODING_ENDPOINT, params=params)

    if response.status_code == 200:
        data = response.json()
        candidates = data.get('candidates', [])
        if candidates:
            location = candidates[0].get('location')
            if location:
                return location.get('y'), location.get('x')

    return None, None


def get_neighborhood(lat, lon):
    params = {
        'geometryType': 'esriGeometryPoint',
        'geometry': f'{lon},{lat}',
        'f': 'json'
    }
    response = requests.get(NEIGHBORHOOD_ENDPOINT, params=params)

    if response.status_code == 200:
        data = response.json()
        features = data.get('features', [])
        if features:
            neighborhood_name = features[0]['attributes'].get('NAME')
            return neighborhood_name
    return None


def recursive_geocode_address(address, current_neighborhood=''):
    lat, lon = get_coordinates(address)
    next_address = address.replace(
        str(address.split()[0]), str(int(address.split()[0]) + 100))

    if lat is not None and lon is not None:
        neighborhood_name = get_neighborhood(lat, lon)
        print(f'Address: {address}')
        print(f'Neighborhood: {neighborhood_name}')
        print(f'--' * 20)

        if neighborhood_name == current_neighborhood or current_neighborhood == '':
            recursive_geocode_address(next_address, neighborhood_name)
    else:
        recursive_geocode_address(next_address, current_neighborhood)


def main() -> None:
    test_data = input()
    recursive_geocode_address(test_data)


if __name__ == "__main__":
    main()
