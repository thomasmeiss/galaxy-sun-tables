# galaxy-sun-tables
Contains:
1. Split galaxy and sun sub-tables for L2A RSS-SMAP-Salinity-Processing-V5.0.
2. FORTRAN90 routines for merging the small sub-tables into large tables that get ingested into the L2A processing of RSS-SMAP-Salinity-Processing-V5.0.

This repository and associated release contain the galaxy and sun tables that are used during the L2A processing of RSS-SMAP-Salinity-Processing-V5.0.

Due to storage and memory restrictions the galaxy and sun tables have ot be split into subtables before storage.

Option 1: Merging sub-tables into large tables, which ar ingested into the L2A processor.
For hoousekeeping purposes move all galaxy sub-tables into a subdirectory galaxy_subtables and all sun sub-tables into a subdirectory sun_subtables.
Then run the provided FORTRAN routines merge_galaxy_wind_tables.F90 and merge_sun_tables.F90. This will create the 
large merged tables galaxy_wind_tables.dat and sun_tables.dat. 
For running the L2A processor code, copy these tables into the tables_L2A subdirecotry of the main direcotry of RSS-SMAP-Salinity-Processing-V5.0.
If another subdirecotry is chosen, then the filenmae code of the L2A processor needs to be changed accordingly.

Option 2: The read routine read_rss_l1a.f90 of the L2A package of RSS-SMAP-Salinity-Processing-V5.0 can be easily changed to read diirectly from the small 
sub-tables rather than the large merged tables.
