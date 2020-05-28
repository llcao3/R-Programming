## This script creates two functions: makeCacheMatrix and cachesolve

## makeCacheMatrix creates a special "matrix" object that can cache its inverse. 
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() { x }
        setinv <- function(inv) { i <<- inv }
        getinv <- function() { i }
        list(set=set, get=get, setinv=setinv, getinv=getinv)
}

## cacheSolve computes and returns the inverse of the special matrix returned by makeCacheMatrix.

cacheSolve <- function(x,...) {
        i <- x$getinv()
        if(!is.null(i)){
                message("getting cached data")
                return(i)
        }
        ## retrieves the cached matrix
        data <- x$get()
        ## Return a matrix that is the inverse of 'x'
        i <- solve(data, ...)
        x$setinv(i)
        i
        
}
