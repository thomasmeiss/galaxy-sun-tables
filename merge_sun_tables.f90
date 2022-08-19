	program merge_sun_tables
	! merge sub-tables finto original large table

    implicit none
    
    integer(4), parameter           :: ncel=180, nomega=1441, nzang=1441  
	integer(4)                      :: izang,istokes,icel,itab
	real(4), dimension(nomega)      :: xbuf(nomega)
	
	character(len=250)              :: sun_file, file_split, file_header

   	real(8), dimension(nzang)       :: time_sun
	real(4), dimension(nzang,ncel)  :: eia_sun    

    sun_file = 'sun_tables_merged.dat'
    file_header = 'sun_subtables\sun_time_eia.dat'
		
    open(unit=4,file=sun_file,access='stream',form='unformatted',action='write')
	open(unit=3,file=file_header,action='read',access='stream',form='unformatted',status='old')
	read(3)  time_sun,eia_sun
	write(4) time_sun,eia_sun
	close(3)
	write(*,*) ' TIME, EIA done'
	write(*,*)
	
	do itab=1,2  !itab 1 is direct sun, itab 2 is the reflected sun  
    do icel=1,ncel
    
    write(file_split,1001) itab,icel
    1001 format('sun_subtables\sun_subtable_itab_',i1.1,'_icel_',i3.3,'.dat')
    open(unit=3,file=file_split,action='read',access='stream',form='unformatted',status='old')
    do istokes=1,3
    do izang=1,nzang
    read(3) xbuf
    write(4)xbuf
    enddo ! izang
    enddo ! istokes
    close(3)
    write(*,*) 'sun itab icel  ', itab, icel,' done'
    
    enddo ! icel
    enddo ! itab
	
	close(4)
    stop ' normal end program merge_sun_tables'
    end program merge_sun_tables 
