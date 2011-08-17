\name{viopoints}
\alias{viopoints}
\alias{viopoints.formula}
\alias{viopoints.default}
\title{1-D Scatter Plots with Jitter Using Kernel Density Estimates}
\description{
\code{viopoints} draws one dimensional scatter plots with jitter using kernel
density estimates. The plots are similar to \code{\link{stripchart}} 
when the sample size is small. If the sample size is large, the plots are
similar to violin plots. 
}

\usage{
viopoints(x, \dots)

\method{viopoints}{formula}(formula, data = NULL, \dots, subset, na.action = NULL)

\method{viopoints}{default}(x, \dots, groups, at, horizontal = FALSE, 
    jitter = 0.2, density.par = list(na.rm = TRUE), points = TRUE, 
    pch = par("pch"), cex = par("cex"), col = "red", bg = "pink",
    lines = FALSE, line.lty = par("lty"), line.lwd = 0.5, 
    line.col = "lightgray", add = FALSE, axis.par, group.names, 
    main = "", xlab = "", ylab = "", xlim, ylim, log = "")
}

\arguments{
  \item{formula}{a formula, such as \code{y ~ g}, 
    where \code{y} is a numeric vector or matrix of data values 
    to be split into groups according to the grouping variable \code{g} 
    (usually a factor). A matrix is allowed for \code{y}. 
    A formula of the form \code{y ~ 1} indicates no grouping.}
  \item{data}{a data frame (or list) from which the variables in
    \code{formula} should be taken.}
  \item{\dots}{For the formula method, further arguments to be passed 
    to the default method. For the default method, additional data.}
  \item{subset}{an optional vector specifying a subset of observations
    to be used for plotting.}
  \item{na.action}{a function which indicates what should happen 
    when the data contain NAs. The default is to ignore missing values 
    in either the response or the group.}
  \item{x}{data, either a numeric vector, matrix or data frame (list).}
  \item{groups}{grouping variable (usually a factor).}
  \item{at}{a numeric vector giving the locations where component plots 
    should be drawn; defaults to \code{1:k} where \code{k} is the number of
    components. Non-unique values can be specified. 
    Argument \code{at} will be recycled to the number of components 
    if necessary. See Details below.}
  \item{horizontal}{logical, if true the plots are drawn horizontally 
    rather than the default vertical.}
  \item{jitter}{the amount of jittering, 
    corresponding to the height of the density estimator.}
  \item{density.par}{list of arguments passed to \code{\link{density}}.}
  \item{points}{logical, if true (the default) draw points.}
  \item{pch, cex, col, bg}{\link{graphical parameters} passed to 
   \code{\link{points}}. Parameters will be recycled if necessary.
   See Details below.}
  \item{lines}{logical, if true draw lines in a similar way to 
    parallel coordinates plots, defaults to \code{FALSE}.}
  \item{line.lty, line.lwd, line.col}{the line type, width and color 
    for lines, passed to \code{\link{arrows}}. Parameters will be recycled 
    if necessary. See Details below.}
  \item{add}{logical, if true \emph{add} points to current plot, 
    defaults to \code{FALSE}.}
  \item{axis.par}{list of arguments passed to \code{\link{axis}}. 
    If specified, \code{group.names} is ignored.}
  \item{group.names}{labels for the group axis.}
  \item{main, xlab, ylab}{character strings for annotation, 
    passed to \code{\link{title}}.}
  \item{xlim, ylim}{numeric vectors of length 2, giving the range for the plot,
    passed to \code{\link{plot.window}}.}
  \item{log}{a character string, indicating if any axis should be drawn 
    in log scale, passed to \code{\link{plot.window}}.}
}

\details{
The number of components \code{k} is the product of the number of (column) 
vectors \code{n} and the number of levels of group \code{m}.
Argument \code{at} is recycled to the length \code{k} if necessary. 
Graphical parameters \code{pch}, \code{cex}, \code{col}, \code{bg}, 
\code{line.lty}, \code{line.lwd}, \code{line.col} are recycled as follows.
If the length of a parameter is greater than \code{m}, 
the parameter is recycled to the length {k}.
Otherwise the parameter is recycled to the length \code{m} first, 
then each element of the parameter is repeated \code{n} times.

The group axis is the x axis 
if \code{horizontal} is \code{FALSE} (the default). 

Points are drawn after lines so that lines do not hide points.
}

\value{An invisible numeric vector, 
giving the coordinates of the center of each component on the group axis.}

\references{
Hintze, J. L. and Nelson, R. D. (1998). \emph{Violin plots: a box plot-density trace synergism.} The American Statistician, 52(2):181-184.
}

\author{Yuki Atoh \email{yuki.atoh@gmail.com}}

\seealso{
\code{\link{boxplot}}, \code{\link{stripchart}}, \code{\link{density}},
\code{\link[vioplot]{vioplot}} in package \pkg{vioplot},
\code{\link[beanplot]{beanplot}} in package \pkg{beanplot},
\code{\link[beeswarm]{beeswarm}} in package \pkg{beeswarm}
}

\examples{
viopoints(decrease ~ treatment, data = OrchardSprays, col=rainbow(8), 
  log = "y", ylim = c(1,200))

viopoints(list(unif=runif(300, -1, 1), norm=rnorm(500), exp=rexp(100)), 
  xlim=c(-5,5), horizontal=TRUE, jitter=0.3, col=2:4)

boxplot(Sepal.Length ~ Species, data=iris)
viopoints(Sepal.Length ~ Species, data=iris, col=2:4, add=TRUE)

boxplot(iris[1:4])
viopoints(iris[1:4], groups=iris[5], col=2:4, at=1:4, 
  lines=TRUE, line.col=c("pink", "lightgreen", "skyblue"), add=TRUE)

\dontrun{
viopoints(as.matrix(iris[1:4]) ~ Species, data=iris, jitter=0.3, col=2:4,
  axis.par=list(at=1:12, labels=paste(rep(substr(levels(factor(iris[,5])),1,3), 
  each=4), c("SL","SW","PL","PW"), sep="."), cex.axis=0.8, las=3))}
}

\keyword{ hplot }
