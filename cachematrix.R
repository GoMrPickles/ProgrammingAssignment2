## Coursera R Programming
## Assignment 2
## Example code modified slightly - essentially working explicitly with matrices instead of vectors.
## I don't really understand this code, but I understand how to modify code and specify a matrix.
## So that's what I did.

## makeCacheMatrix is a modification of the example code. I specify a matrix x,
## and store it in a variable y outside of the definition of makeCacheMatrix.

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL

## define the function "set" with argument y.
## x is the argument to makeCacheMatrix, and it is stored as y.
## m is defined as NULL in this function and outside it.
## does << go one environment up, or globally? Is <<<- a thing?

  set <- function(y) {
    x <<- y
    m <<- NULL
  }

## Same question as below - what's with the floating x?
  get <- function() x

## I don't understand these lines.
## Like, why the floating "m" over there?
  setmatrix <- function(solve) m <<- solve
  getmatrix <- function() m
  
## I don't understand this list.
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)

}


## Return a matrix that is the inverse of x using solve(x)

cacheSolve <- function(x = matrix(), ...) {

        m <- x$getmatrix()

## If m is not null, then the cached data is returned.
## This can be verified by running something like "cacheSolve(someMatrix)" twice.
## if the data is cached, the message will be shown and the cached data returned from m.

  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }

## assign the matrix specified in the argument to "matrix"
  matrix <- x$get()
  
## solve the matrix specified in argument to the function and assign it to m
  m <- solve(matrix, ...)

## not sure what this line does.
  x$setmatrix(m)

## return m  
  m

}
