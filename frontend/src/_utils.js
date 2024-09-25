const convertToBoolean = input => {
    if (!input) return undefined
    
    return typeof input === 'boolean' ? input : input === 'true';
}

const textTransform = (type, value) => {
    switch (type) {
        case 'lowercase':
            return value.toLowerCase();
        case 'uppercase':
            return value.toUpperCase();
        case 'capitalize':
            return value.charAt(0).toUpperCase() + value.slice(1);
        default:
            return "Invalid transformation type";
    }
}


export { convertToBoolean, textTransform }