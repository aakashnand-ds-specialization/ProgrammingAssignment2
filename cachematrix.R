## Put comments here that give an overall description of what your
## functions do

## Following function creates a cached matrix

makeCacheMatrix <- function(x = matrix()) {
  caching_variable<-NULL
  
  set <-function(y){
    x <<- y
    m<<-NULL
  }
  
  get <- function(){
    x
  } 
  
  setinverse<-function(inverse_matrix) {
    caching_variable<<-inverse_matrix
  }
  
  getinverse <-function(){
    caching_variable
  }
  
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
  
}


## Following function caches inverse of matrix

cacheSolve <- function(x, ...) {
        inverse_matrix <- x$getinverse()
        if(!is.null(inverse_matrix)){
          message("getting cached data...")
          return(inverse_matrix)
        }
        data<-x$get()
        inverse_matrix<-solve(data)
        message("caching this inverse matrix")
        x$setinverse(inverse_matrix)
        inverse_matrix
        ## Return a matrix that is the inverse of 'x'
}

## CONSOLE OUTPUT

# > mat_obj=matrix(5:8, nrow = 2, ncol = 2)
# > my_matrix<-makeCacheMatrix(mat_obj)
# > cacheSolve(my_matrix)
# caching this inverse matrix
# [,1] [,2]
# [1,]   -4  3.5
# [2,]    3 -2.5
# > cacheSolve(my_matrix)
# getting cached data...
# [,1] [,2]
# [1,]   -4  3.5
# [2,]    3 -2.5
# > 


