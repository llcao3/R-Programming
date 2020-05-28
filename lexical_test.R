
# f <- function() { x <- 7; print(x) ; x }

x <- 1
#print(x)

g <- function() {
        f <- function() {
                x <- 7
                print(x)
        }
#        x <- 100
        print("Inside g()")
        print(x)
        list(f=f)
}

g_instance <- g()

g_instance$f()

#print(x)

