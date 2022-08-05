	program merge_galaxy_wind_tables
	! merge sub-tables finto original large table

    implicit none
    
    integer(4), parameter           :: ncel=180, nomega=1441, nzang=1441  
	integer(4)                      :: izang,istokes,icel,itab
	real(4), dimension(nomega)      :: xbuf(nomega)
	
	character(len=250)              :: galaxy_file, file_split, file_header

   	real(8), dimension(nzang)       :: time_galaxy
	real(4), dimension(nzang,ncel)  :: eia_galaxy    

    galaxy_file = 'galaxy_wind_tables_merged.dat'
    file_header = 'galaxy_subtables\galaxy_time_eia.dat'
		
    open(unit=4,file=galaxy_file,access='sequential',form='binary',action='write')
	open(unit=3,file=file_header,action='read',form='binary',status='old')
	read(3)  time_galaxy,eia_galaxy
	write(4) time_galaxy,eia_galaxy
	close(3)
	write(*,*) ' TIME, EIA done'
	write(*,*)
	
	do itab=1,6  !itab 1 is direct galaxy, itab 2-6 are the 5 winds for reflected galaxy 
    do icel=1,ncel
    
    write(file_split,1001) itab,icel
    1001 format('galaxy_subtables\galaxy_wind_subtable_itab_',i1.1,'_icel_',i3.3,'.dat')
    open(unit=3,file=file_split,action='read',form='binary',status='old')
    do istokes=1,3
    do izang=1,nzang
    read(3) xbuf
    write(4)xbuf
    enddo ! izang
    enddo ! istokes
    close(3)
    write(*,*) 'galaxy wind itab icel  ', itab, icel,' done'
    
    enddo ! icel
    enddo ! itab
	
	close(4)
    stop ' normal end program merge_galaxy_wind_tables'
    end program merge_galaxy_wind_tables 
