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

\method{viopoints}{default}(x, \dots, groups, na.group = FALSE,
    method = "violin", side = "both", amount = jitter, 
    jitter = 0.2, offset = 1, density.par = list(na.rm = TRUE), 
    horizontal = !vertical, vertical = TRUE, at, points = TRUE, 
    pch = par("pch"), cex = par("cex"), col = "red", bg = "pink", 
    lines = FALSE, line.lty = par("lty"), line.lwd = 0.5, 
    line.col = "lightgray", add = FALSE, axes = TRUE, 
    frame.plot = axes, axis.par, group.names, main = "", sub = "", 
    xlab, ylab, dlab = "", glab = "", xlim, ylim, log = "")
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
  \item{na.group}{logical, if false (the default) drop an 'NA' level
    from \code{groups}.}
  \item{method}{the method to be used to separate coincident points. 
    The points are jitterd using kernel density estimates 
    if \code{"violin"} (the default) is specified. The points are 
    uniformly jittered if \code{"jitter"} is specified. The points are 
    overplotted if \code{"overplot"} is specified. The coincident points 
    are stacked if \code{"stack"} is specified. The last method only makes 
    sense for very granular data.}
  \item{amount, jitter}{the amount of jitter when the method \code{"violin"} or
    \code{"jitter"} is used, the height of stack if the method \code{"stack"}
    is used. In the latter case, \code{NA} may be specified for the stack 
    without a height adjustment. If \code{amount} is not specified,
    \code{jitter} can be used as the amount of jitter.}
  \item{offset}{when the method \code{"stack"} is used, points are stacked 
    with the specified offset.}
  \item{density.par}{list of arguments passed to \code{\link{density}}.}
  \item{horizontal, vertical}{logical. If \code{horizontal} is \code{FALSE}
    (the default), the plots are drawn vertically with the first plot 
    to the left. If \code{horizontal} is \code{TRUE}, the plots are drawn
    horizontally with the first plot at the bottom. If \code{horizontal}
    is not specified, \code{vertical} can be used to set a graph orientation.}
  \item{at}{a numeric vector giving the locations where component plots 
    should be drawn; defaults to \code{1:k} where \code{k} is the number of
    components. Non-unique values can be specified. 
    The argument \code{at} will be recycled to the number of components 
    if necessary. See Details below.}
  \item{side}{the side on which the points are plotted, one of \code{"both"}
    (the default), \code{"positive"} or \code{"negative"}.
    The argument \code{side} will be recycled to the number of components
    if necessary. See Details below.}
  \item{points}{logical, if true (the default) draw points.}
  \item{pch, cex, col, bg}{graphical parameters passed to 
   \code{\link{points}}. Parameters will be recycled if necessary.
   See Details below.}
  \item{lines}{logical, if true draw lines in a similar way to 
    parallel coordinates plots, defaults to \code{FALSE}.}
  \item{line.lty, line.lwd, line.col}{the line type, width and color 
    for lines, passed to \code{\link{arrows}}. Parameters will be recycled 
    if necessary. See Details below.}
  \item{add}{logical, if true \emph{add} points or lines to current plot, 
    defaults to \code{FALSE}.}
  \item{axes}{logical, whether to plot axes; defaults to \code{TRUE}.}
  \item{frame.plot}{logical, indicating if a frame (\code{\link{box}}) 
    should be drawn; defaults to \code{TRUE} unless \code{axes=FALSE} 
    is specified.}
  \item{axis.par}{list of arguments passed to \code{\link{axis}}. 
    If specified, \code{group.names} is ignored.}
  \item{group.names}{labels for the group axis.}
  \item{main, sub, xlab, ylab}{character strings for annotation, 
    passed to \code{\link{title}}.}
  \item{dlab, glab}{an alternative way to specify axis labels: 
    see Details below.}
  \item{xlim, ylim}{numeric vectors of length 2, giving the range for the plot,
    passed to \code{\link{plot.window}}.}
  \item{log}{a character string, indicating if any axis should be drawn 
    in log scale, passed to \code{\link{plot.window}}.}
}

\details{
The number of components \code{k} is the product of the number of (column) 
vectors \code{n} and the number of levels of group \code{m}.
Arguments \code{at} and \code{side} are recycled to the length \code{k}.
Graphical parameters \code{pch}, \code{cex}, \code{col}, \code{bg}, 
\code{line.lty}, \code{line.lwd}, \code{line.col} are recycled as follows.
If the length of a parameter is greater than \code{m}, 
the parameter is recycled to the length \code{k}.
Otherwise the parameter is recycled to the length \code{m} first, 
then each element of the parameter is repeated \code{n} times.

The \code{dlab} and \code{glab} labels may be used instead of \code{xlab}
and \code{ylab} if those are not specified. \code{dlab} applies to the
continuous data axis (the y axis if \code{horizontal=FALSE} or 
\code{vertical=TRUE}), \code{glab} to the group axis.

If \code{add=TRUE}, arguments \code{axes}, \code{frame.plot}, 
\code{axis.par}, \code{group.names}, \code{main}, \code{sub},
\code{xlab}, \code{ylab}, \code{dlab}, \code{glab},
\code{xlim}, \code{ylim}, \code{log} will be ignored.

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
\code{\link[beeswarm]{beeswarm}} in package \pkg{beeswarm},
\code{\link[parviol]{parviol}} in package \pkg{parviol}
}

\examples{
op <- par(mfrow=c(2,2))
gn <- c("SL", "SW", "PL", "PW")
for (i in c("overplot", "stack", "jitter", "violin"))
  viopoints(iris[1:4], method=i, horizontal=TRUE, col=2:5, group.names=gn, 
    main=i)
par(op)

boxplot(Sepal.Length ~ Species, data=iris, ylab="Sepal.Length")
viopoints(Sepal.Length ~ Species, data=iris, col=2:4, add=TRUE)

boxplot(iris[1:4])
viopoints(iris[1:4], groups=iris[5], col=2:4, at=1:4+rep(c(-0.2,0,0.2),each=4),
  jitter=0.1, add=TRUE)
legend("topright", legend=levels(factor(iris[,5])), pch=1, col=2:4)

boxplot(iris[1:4])
viopoints(as.matrix(iris[1:4])~iris[,5], col=2:4, at=1:4,
  lines=TRUE, line.col=c("pink", "lightgreen", "skyblue"), add=TRUE)
legend("topright", legend=levels(factor(iris[,5])), pch=1, col=2:4)

viopoints(iris[c(1,3)], groups=iris[5], method="stack", amount=NA,
  at=rep(1:3,each=2), pch=rep(1:2,3), side=c("n","p"), col=rep(2:3,3), 
  group.names=levels(factor(iris[,5])), main="stack")
legend("topleft", pch=1:2, col=2:3, legend=colnames(iris[c(1,3)]))


\dontrun{
viopoints(as.matrix(iris[1:4]) ~ Species, data=iris, jitter=0.3, col=2:4,
  axis.par=list(at=1:12, labels=paste(rep(substr(levels(factor(iris[,5])),1,3), 
  each=4), c("SL","SW","PL","PW"), sep="."), cex.axis=0.8, las=3))}
}

\keyword{ hplot }

