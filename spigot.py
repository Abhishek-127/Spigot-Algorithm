
def spigot():
    filename = get_file_info()
    f = open(filename, 'w')
    length = 0
    nines = 0
    predigit = 0
    N = 1000
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
            print(predigit+1)
            pi += str(predigit + 1)
            for k in range(0, nines):
                print(0)
                pi += '0'
            predigit = 0
            nines = 0
        else:
            print(predigit)
            pi += str(predigit)
            predigit  = q
            if (nines != 0):
                for k in range(0, nines):
                    print(9)
                    pi += '9'
                nines = 0
            
        
    print(predigit)
    pi += str(predigit)
    pi += "\n"
    f.write(pi)
    f.close()



def get_file_info():
    filename = raw_input("Enter the filename: ")
    print(filename)
    return filename



def main():
    a = 10
    b = 3
    spigot()


if __name__ == '__main__':
    main()
