-- Create the table
CREATE TABLE house_prices (
    id INT PRIMARY KEY,
    mssubclass INT,
    mszoning VARCHAR(20),
    lotfrontage FLOAT,
    lotarea INT,
    street VARCHAR(20),
    alley VARCHAR(20),
    lotshape VARCHAR(20),
    landcontour VARCHAR(20),
    utilities VARCHAR(20),
    lotconfig VARCHAR(20),
    landslope VARCHAR(20),
    neighborhood VARCHAR(50),
    condition1 VARCHAR(20),
    condition2 VARCHAR(20),
    bldgtype VARCHAR(20),
    housestyle VARCHAR(20),
    overallqual INT,
    overallcond INT,
    yearbuilt INT,
    yearremodadd INT,
    roofstyle VARCHAR(20),
    roofmatl VARCHAR(20),
    exterior1st VARCHAR(20),
    exterior2nd VARCHAR(20),
    masvnrtype VARCHAR(20),
    masvnrarea FLOAT,
    exterqual VARCHAR(20),
    extercond VARCHAR(20),
    foundation VARCHAR(20),
    bsmtqual VARCHAR(20),
    bsmtcond VARCHAR(20),
    bsmtexposure VARCHAR(20),
    bsmtfintype1 VARCHAR(20),
    bsmtfinsf1 INT,
    bsmtfintype2 VARCHAR(20),
    bsmtfinsf2 INT,
    bsmtnfsf INT,
    totalbsmtsf INT,
    heating VARCHAR(20),
    heatingqc VARCHAR(20),
    centralair VARCHAR(5),
    electrical VARCHAR(20),
    firstflrsf INT,
    secondflrsf INT,
    lowqualfinsf INT,
    grlivarea INT,
    bsmtfullbath INT,
    bsmthalfbath INT,
    fullbath INT,
    halfbath INT,
    bedroomabvgr INT,
    kitchenabvgr INT,
    kitchenqual VARCHAR(20),
    totrmsabvgrd INT,
    functional VARCHAR(20),
    fireplaces INT,
    fireplacequ VARCHAR(20),
    garagetype VARCHAR(20),
    garageyrblt FLOAT,
    garagefinish VARCHAR(20),
    garagecars INT,
    garagearea INT,
    garagequal VARCHAR(20),
    garagecond VARCHAR(20),
    paveddrive VARCHAR(5),
    wooddecksf INT,
    openporchsf INT,
    enclosedporch INT,
    threessnporch INT,
    screenporch INT,
    poolarea INT,
    poolqc VARCHAR(20),
    fence VARCHAR(20),
    miscfeature VARCHAR(20),
    miscval INT,
    mosold INT,
    yrsold INT,
    saletype VARCHAR(20),
    salecondition VARCHAR(20),
    saleprice INT
);

-- General Information
COMMENT ON TABLE house_prices IS 'House Prices Dataset';

-- Identifiers
COMMENT ON COLUMN house_prices.id IS 'Unique identifier for each property';

-- MS Subclass & Zoning
COMMENT ON COLUMN house_prices.mssubclass IS 'The type of dwelling involved in the sale (e.g., single-family detached, duplex)';
COMMENT ON COLUMN house_prices.mszoning IS 'The general zoning classification of the sale (e.g., RL - Residential Low Density)';

-- Lot Information
COMMENT ON COLUMN house_prices.lotfrontage IS 'Linear feet of street connected to the property';
COMMENT ON COLUMN house_prices.lotarea IS 'Lot size in square feet';
COMMENT ON COLUMN house_prices.street IS 'Type of road access to the property (paved or gravel)';
COMMENT ON COLUMN house_prices.alley IS 'Type of alley access to the property';
COMMENT ON COLUMN house_prices.lotshape IS 'General shape of the property (regular, slightly irregular, etc.)';
COMMENT ON COLUMN house_prices.landcontour IS 'Flatness of the property (level, sloping, etc.)';
COMMENT ON COLUMN house_prices.utilities IS 'Type of utilities available (e.g., all public utilities)';
COMMENT ON COLUMN house_prices.lotconfig IS 'Lot configuration (corner, cul-de-sac, etc.)';
COMMENT ON COLUMN house_prices.landslope IS 'Slope of the property (gentle, moderate, severe)';

-- Location Details
COMMENT ON COLUMN house_prices.neighborhood IS 'Physical locations within the city (e.g., proximity to amenities)';
COMMENT ON COLUMN house_prices.condition1 IS 'Proximity to main road or railroad (positive or negative)';
COMMENT ON COLUMN house_prices.condition2 IS 'Proximity to secondary roads or railroads (if applicable)';

-- House Type
COMMENT ON COLUMN house_prices.bldgtype IS 'Type of dwelling (single-family, townhouse, duplex, etc.)';
COMMENT ON COLUMN house_prices.housestyle IS 'Style of dwelling (1-story, 2-story, split-level, etc.)';

-- Overall Quality & Condition
COMMENT ON COLUMN house_prices.overallqual IS 'Overall material and finish quality (rated 1-10)';
COMMENT ON COLUMN house_prices.overallcond IS 'Overall condition of the house (rated 1-10)';

-- Year Built & Remodeling
COMMENT ON COLUMN house_prices.yearbuilt IS 'Original construction year of the house';
COMMENT ON COLUMN house_prices.yearremodadd IS 'Year of remodeling or addition (if applicable)';

-- Roof & Exterior
COMMENT ON COLUMN house_prices.roofstyle IS 'Type of roof (gable, hip, flat, etc.)';
COMMENT ON COLUMN house_prices.roofmatl IS 'Roof material (composition shingles, metal, etc.)';
COMMENT ON COLUMN house_prices.exterior1st IS 'Exterior covering on the house (primary)';
COMMENT ON COLUMN house_prices.exterior2nd IS 'Exterior covering on the house (secondary)';

-- Masonry Details
COMMENT ON COLUMN house_prices.masvnrtype IS 'Masonry veneer type (brick, stone, none, etc.)';
COMMENT ON COLUMN house_prices.masvnrarea IS 'Masonry veneer area in square feet';

-- Exterior Quality
COMMENT ON COLUMN house_prices.exterqual IS 'Exterior material quality (excellent to poor)';
COMMENT ON COLUMN house_prices.extercond IS 'Current condition of the exterior material';

-- Basement Information
COMMENT ON COLUMN house_prices.foundation IS 'Type of foundation (poured concrete, slab, etc.)';
COMMENT ON COLUMN house_prices.bsmtqual IS 'Basement height quality (excellent to poor)';
COMMENT ON COLUMN house_prices.bsmtcond IS 'Basement condition (good, fair, poor)';
COMMENT ON COLUMN house_prices.bsmtexposure IS 'Walkout or garden-level basement walls exposure (good, average, none)';
COMMENT ON COLUMN house_prices.bsmtfintype1 IS 'Rating of the largest finished area in the basement';
COMMENT ON COLUMN house_prices.bsmtfinsf1 IS 'Finished square feet of the largest basement area';
COMMENT ON COLUMN house_prices.bsmtfintype2 IS 'Rating of the second finished area (if applicable)';
COMMENT ON COLUMN house_prices.bsmtfinsf2 IS 'Finished square feet of the second basement area';
COMMENT ON COLUMN house_prices.bsmtnfsf IS 'Unfinished square feet of basement area';
COMMENT ON COLUMN house_prices.totalbsmtsf IS 'Total square feet of basement area';

-- Heating & Cooling
COMMENT ON COLUMN house_prices.heating IS 'Type of heating system (gas, electric, etc.)';
COMMENT ON COLUMN house_prices.heatingqc IS 'Heating system quality and condition';
COMMENT ON COLUMN house_prices.centralair IS 'Central air conditioning (Y = Yes, N = No)';

-- Electrical System
COMMENT ON COLUMN house_prices.electrical IS 'Type of electrical system (standard, fuse box, etc.)';

-- Above Ground Living Area
COMMENT ON COLUMN house_prices.firstflrsf IS 'First floor square footage';
COMMENT ON COLUMN house_prices.secondflrsf IS 'Second floor square footage';
COMMENT ON COLUMN house_prices.lowqualfinsf IS 'Low-quality finished square footage (all floors)';
COMMENT ON COLUMN house_prices.grlivarea IS 'Above-grade (ground) living area square feet';

-- Bathrooms
COMMENT ON COLUMN house_prices.bsmtfullbath IS 'Number of full bathrooms in the basement';
COMMENT ON COLUMN house_prices.bsmthalfbath IS 'Number of half bathrooms in the basement';
COMMENT ON COLUMN house_prices.fullbath IS 'Number of full bathrooms above ground';
COMMENT ON COLUMN house_prices.halfbath IS 'Number of half bathrooms above ground';

-- Bedrooms & Kitchens
COMMENT ON COLUMN house_prices.bedroomabvgr IS 'Number of bedrooms above ground (does NOT include basement bedrooms)';
COMMENT ON COLUMN house_prices.kitchenabvgr IS 'Number of kitchens above ground';
COMMENT ON COLUMN house_prices.kitchenqual IS 'Kitchen quality rating';

-- Rooms & Functionality
COMMENT ON COLUMN house_prices.totrmsabvgrd IS 'Total number of rooms above ground (excluding bathrooms)';
COMMENT ON COLUMN house_prices.functional IS 'Home functionality rating (typical or minor issues)';

-- Fireplaces
COMMENT ON COLUMN house_prices.fireplaces IS 'Number of fireplaces';
COMMENT ON COLUMN house_prices.fireplacequ IS 'Quality of the fireplace';

-- Garage Details
COMMENT ON COLUMN house_prices.garagetype IS 'Type of garage (attached, detached, etc.)';
COMMENT ON COLUMN house_prices.garageyrblt IS 'Year the garage was built';
COMMENT ON COLUMN house_prices.garagefinish IS 'Interior finish of the garage';
COMMENT ON COLUMN house_prices.garagecars IS 'Garage capacity in car spaces';
COMMENT ON COLUMN house_prices.garagearea IS 'Size of garage in square feet';
COMMENT ON COLUMN house_prices.garagequal IS 'Garage quality rating';
COMMENT ON COLUMN house_prices.garagecond IS 'Garage condition rating';

-- Driveway & Outdoor Features
COMMENT ON COLUMN house_prices.paveddrive IS 'Paved driveway indicator (Y = paved, N = not paved)';
COMMENT ON COLUMN house_prices.wooddecksf IS 'Wood deck area in square feet';
COMMENT ON COLUMN house_prices.openporchsf IS 'Open porch area in square feet';
COMMENT ON COLUMN house_prices.enclosedporch IS 'Enclosed porch area in square feet';
COMMENT ON COLUMN house_prices.threessnporch IS 'Three-season porch area in square feet';
COMMENT ON COLUMN house_prices.screenporch IS 'Screen porch area in square feet';

-- Pools & Fences
COMMENT ON COLUMN house_prices.poolarea IS 'Pool area in square feet';
COMMENT ON COLUMN house_prices.poolqc IS 'Pool quality rating';
COMMENT ON COLUMN house_prices.fence IS 'Fence quality or type';

-- Miscellaneous
COMMENT ON COLUMN house_prices.miscfeature IS 'Miscellaneous feature not covered in other categories (e.g., shed)';
COMMENT ON COLUMN house_prices.miscval IS 'Value of miscellaneous feature';

-- Sale Information
COMMENT ON COLUMN house_prices.mosold IS 'Month the property was sold';
COMMENT ON COLUMN house_prices.yrsold IS 'Year the property was sold';
COMMENT ON COLUMN house_prices.saletype IS 'Type of sale (normal, foreclosure, etc.)';
COMMENT ON COLUMN house_prices.salecondition IS 'Condition of sale (e.g., partial sale, family sale)';
COMMENT ON COLUMN house_prices.saleprice IS 'Target variable representing the sale price of the house in USD';
