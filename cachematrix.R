## These 2 functions create a special type of matrix that can cache its inverse


## This function return a special type of matrix that can cache its inverse 
## actually the function return list of functions: 
## [[1]] set: set value of matrix, set inverse of matrix to NULL
## [[2]] get: get value of matrix
## [[3]] setinverse: set inverse of matrix
## [[4]] getinverse: get inverse of matrix



makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(mat){
                x <<- mat
                inv <<- NULL        
        }
        
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        
        list(set = set, get = get, getinverse = getinverse, setinverse = setinverse)
}


## The function compute inverse (special type of) matrix 'x' (that have set, get, setinverse, getinverse functions)
## if input x's inverse had computed, the function returns cached matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		inv <- m$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- m$get()
        inv <- solve(data, ...)
        m$setinverse(inv)
        inv
}
