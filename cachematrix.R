## The following two functions can be used to create a matrix for which the inverse of the matrix can be cached. 
## The first function creates the matrix the second function can be used to calculate the inverse

## The following function creates a special "matrix", which is a list containing four functions to: ----------------------------
## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the matrix inverse
## 4.  get the value of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The following functions calculates the inverse of the matrix. However it first checks to see if the mean has already been calculated. ----------------------------

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x' 
  
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
  
}
