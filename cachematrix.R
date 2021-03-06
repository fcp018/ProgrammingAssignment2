## R Programming Project 2

## The first function, makeCacheMatrix creates a special "matrix" object 
## that can cache its inverse by
## setting and getting the value of the martix
## setting and getting the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
          x <<- y
          m <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) m <<- inverse
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## The second function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve retrieves the 
## inverse from the cache.


cacheSolve <- function(x, ...) {
         m <- x$getinv()
         if(!is.null(m)){
              message("getting cached data")
              return(m)
         }
         data<- x$get()
         m <- solve(data, ...)
         x$setinv(m)
         m
}
