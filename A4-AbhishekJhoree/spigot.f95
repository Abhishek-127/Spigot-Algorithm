! @author Abhishek Jhoree
!
program main
    implicit none
    integer :: i, j, k, q, x = 0
    integer :: len, nines, predigit = 0
    character (len = 200) :: filename
    integer :: N = 1000
    real :: start, finish
    
    nines = 0
    predigit = 0
    len = (10 * N/3) + 1

    call get_file_info(filename)
    open(1, file = filename, status = 'replace')

    call cpu_time(start)
    call spigot(i, j, k, q, x, len, N, nines, predigit)
    call cpu_time(finish)
    print '("Execution Time = ",f6.3," seconds.")',finish-start
end program main

subroutine get_file_info(filename)
    character (len = 200), intent(inout) :: filename
    print *, "Enter the name of the file:"
    read (*,'(a)') filename
end subroutine get_file_info

subroutine spigot(i, j, k, q, x, len, N, nines, predigit)
    integer, intent(inout)  :: i, j, k, q, x, len, N, nines, predigit
    integer, dimension(0:len) :: a
    character, dimension(1001) :: c
    character (len = 1001) :: pi
    integer :: pi_c = 0
    a = 2
    pi = ''

    do j = 1, N, 1
        q = 0
        do i = len, 1, -1
            x = 10 * a(i-1) + q * i
            a(i-1) = modulo(x, (2 * i - 1))
            q = x / (2 * i - 1)
        end do
        a(0) = modulo(q, 10)
        q = q / 10
        if(q == 9)  then
            nines = nines + 1
        else if(q == 10) then
            call convert(pi_c, c, (predigit + 1) )
            do k = 0, nines-1, 1
                call convert(pi_c, c, 0)
            end do
            predigit = 0
            nines = 0
        else
            call convert(pi_c, c, predigit)
            predigit = q
            if(nines /= 0) then
                do k = 0, nines-1, 1
                    call convert(pi_c, c, 9)
                end do
                nines = 0
            end if
        end if
    end do
    call convert(pi_c, c, predigit)
    do i = 1, 1001, 1
        pi(i:i) = c(i)
    end do
    print *, '\n', pi
    write(1, '(a)') pi
end subroutine spigot

subroutine convert(pi_c, c, num_to_check)
    integer, intent(inout) :: pi_c
    character, dimension(0:1000), intent(inout) :: c
    integer, intent(in) :: num_to_check

    if(num_to_check == 0) c(pi_c) = '0'
    if(num_to_check == 1) c(pi_c) = '1'
    if(num_to_check == 2) c(pi_c) = '2'
    if(num_to_check == 3) c(pi_c) = '3'
    if(num_to_check == 4) c(pi_c) = '4'
    if(num_to_check == 5) c(pi_c) = '5'
    if(num_to_check == 6) c(pi_c) = '6'
    if(num_to_check == 7) c(pi_c) = '7'
    if(num_to_check == 8) c(pi_c) = '8'
    if(num_to_check == 9) c(pi_c) = '9'
    pi_c = pi_c + 1
end subroutine convert
