# @author: Abhishek Jhoree
# @email: ajhoree@uoguelph.ca
# @id: 0986820
# CIS 3190 Assignment 4

import  time

'''
Spigot function
This is the main function of the program. It performs the spigot's algorithm
until N is reached
@param void
@return void
'''
def spigot():
    filename = get_file_info()

    # start the timer here
    start_time = time.time()
    f = open(filename, 'w')
    length = 0
    nines = 0
    predigit = 0
    N = 1002
    pi = ''

    length = (10 * N/3) + 1
    a = []

    for z in range(length):
        a.append(2)
    
    for j in range(1, N):
        q = 0
        for i in range(length, 0, -1):
            x = 10 * a[i - 1] + q * i
            a[i - 1] = x % (2 * i - 1)
            q = x / (2 * i - 1)

        a[0] = q % 10
        q = q / 10

        if(q == 9):
            nines = nines + 1
        elif(q == 10):
            pi += str(predigit + 1)
            for k in range(0, nines):
                pi += '0'
            predigit = 0
            nines = 0
        else:
            pi += str(predigit)
            predigit  = q
            if (nines != 0):
                for k in range(0, nines):
                    pi += '9'
                nines = 0
            
        
    pi += str(predigit)
    pi += "\n"
    print(pi)
    stop_time = time.time()
    print("Time taken by the algorithm is: ", str(stop_time - start_time), " Seconds")
    f.write(pi)
    f.close()


'''
Helper function to get the file info from the user
Prompts the user for input of a filename to which the value of Pi will be stored to
@param void
@return filename[String] the filename of the file to be used to store Pi
'''
def get_file_info():
    filename = raw_input("Enter the filename: ")
    print(filename)
    return filename


'''
main function
calls spigot function
'''
def main():

    spigot()


if __name__ == '__main__':
    main()
