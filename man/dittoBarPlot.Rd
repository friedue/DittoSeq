% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dittoBarPlot.R
\name{dittoBarPlot}
\alias{dittoBarPlot}
\title{Outputs a stacked bar plot to show the percent composition of samples, groups, clusters, or other groupings}
\usage{
dittoBarPlot(
  object,
  var,
  group.by,
  scale = c("percent", "count"),
  cells.use = NULL,
  data.out = FALSE,
  do.hover = FALSE,
  color.panel = dittoColors(),
  colors = seq_along(color.panel),
  y.breaks = NA,
  min = 0,
  max = NULL,
  var.labels.rename = NULL,
  var.labels.reorder = NULL,
  x.labels = NULL,
  x.labels.rotate = TRUE,
  x.reorder = NULL,
  theme = theme_classic(),
  xlab = group.by,
  ylab = "make",
  main = "make",
  sub = NULL,
  legend.show = TRUE,
  legend.title = NULL
)
}
\arguments{
\item{object}{A Seurat, SingleCellExperiment, or SummarizedExperiment object.}

\item{var}{String name of a metadata that contains discrete data, or a factor or vector containing such data for all cells/samples in the target \code{object}.}

\item{group.by}{String name of a metadata to use for separating the cells/samples into discrete groups.}

\item{scale}{"count" or "percent". Sets whether data should be shown as raw counts or scaled to 1 and shown as a percentage.}

\item{cells.use}{String vector of cells'/samples' names OR an integer vector specifying the indices of cells/samples which should be included.

Alternatively, a Logical vector, the same length as the number of cells in the object, which sets which cells to include.

Note: When \code{cells.use} is combined with \code{scale = "percent"}, left out cells are not considered in calculating percentages. Percents will always total to 1.}

\item{data.out}{Logical. When set to \code{TRUE}, changes the output, from the plot alone, to a list containing the plot ("p") and a data.frame ("data") containing the underlying data.

Note: plotly output is turned off in the \code{data.out = TRUE} setting, but hover.data is still calculated.}

\item{do.hover}{Logical which sets whether the ggplot output should be converted to a ggplotly object with data about individual bars displayed when you hover your cursor over them.}

\item{color.panel}{String vector which sets the colors to draw from. \code{dittoColors()} by default.}

\item{colors}{Integer vector, which sets the indexes / order, of colors from color.panel to actually use.
(Provides an alternative to directly modifying \code{color.panel}.)}

\item{y.breaks}{Numeric vector which sets the plot's tick marks / major gridlines. c(break1,break2,break3,etc.)}

\item{min, max}{Scalars which control the zoom of the plot.
These inputs set the minimum / maximum values of the y-axis.
Default = set based on the limits of the data, 0 to 1 for \code{scale = "percent"}, or 0 to maximum count for 0 to 1 for \code{scale = "count"}.}

\item{var.labels.rename}{String vector for renaming the distinct identities of \code{var} values.}

\item{var.labels.reorder}{Integer vector. A sequence of numbers, from 1 to the number of distinct \code{var} value idententities, for rearranging the order of labels' groupings within the plot.

Method: Make a first plot without this input.
Then, treating the top-most grouping as index 1, and the bottom-most as index n.
Values of \code{var.labels.reorder} should be these indices, but in the order that you would like them rearranged to be.}

\item{x.labels}{String vector which will replaceme the x-axis groupings' labels.
Regardless of \code{x.reorder}, the first component of \code{x.labels} sets the name for the left-most x-axis grouping.}

\item{x.labels.rotate}{Logical which sets whether the x-axis grouping labels should be rotated.}

\item{x.reorder}{Integer vector. A sequence of numbers, from 1 to the number of groupings, for rearranging the order of x-axis groupings.

Method: Make a first plot without this input.
Then, treating the leftmost grouping as index 1, and the rightmost as index n.
Values of \code{x.reorder} should be these indices, but in the order that you would like them rearranged to be.

Recommendation for advanced users: If you find yourself coming back to this input too many times, an alternative solution that can be easier long-term
is to make the target data into a factor, and to put its levels in the desired order: \code{factor(data, levels = c("level1", "level2", ...))}.
\code{\link{metaLevels}} can be used to quickly get the identities that need to be part of this 'levels' input.}

\item{theme}{A ggplot theme which will be applied before dittoSeq adjustments.
Default = \code{theme_classic()}.
See \url{https://ggplot2.tidyverse.org/reference/ggtheme.html} for other options and ideas.}

\item{xlab}{String which sets the x-axis title.
Default is \code{group.by} so it defaults to the name of the grouping information.
Set to \code{NULL} to remove.}

\item{ylab}{String which sets the y-axis title.}

\item{main}{String, sets the plot title}

\item{sub}{String, sets the plot subtitle}

\item{legend.show}{Logical which sets whether the legend should be displayed.}

\item{legend.title}{String which adds a title to the legend.}
}
\value{
A ggplot plot where discrete data, grouped by sample, condition, cluster, etc. on the x-axis, is shown on the y-axis as either counts or percent-of-total-per-grouping in a stacked barplot.

Alternatively, if \code{data.out = TRUE}, a list containing the plot ("p") and a dataframe of the underlying data ("data").

Alternatively, if \code{do.hover = TRUE}, a plotly conversion of the ggplot output in which underlying data can be retrieved upon hovering the cursor over the plot.
}
\description{
Outputs a stacked bar plot to show the percent composition of samples, groups, clusters, or other groupings
}
\details{
The function creates a dataframe containing counts and percent makeup of \code{var} identities for each x-axis grouping (determined by the \code{group.by} input).
If a set of cells/samples to use is indicated with the \code{cells.use} input, only those cells/samples are used for counts and percent makeup calculations.
Then, a vertical bar plot is generated (\code{ggplot2::geom_col()}) showing either percent makeup if
\code{scale = "percent"}, which is the default, or raw counts if \code{scale = "count"}.
}
\section{Many characteristics of the plot can be adjusted using discrete inputs}{

\itemize{
\item Colors can be adjusted with \code{color.panel} and/or \code{colors}.
\item y-axis zoom and tick marks can be adjusted using \code{min}, \code{max}, and \code{y.breaks}.
\item Titles can be adjusted with \code{main}, \code{sub}, \code{xlab}, \code{ylab}, and \code{legend.title} arguments.
\item The legend can be removed by setting \code{legend.show = FALSE}.
\item x-axis labels and groupings can be changed / reordered using \code{x.labels} and \code{x.reorder}, and rotation of these labels can be turned off with \code{x.labels.rotate = FALSE}.
\item y-axis \code{var}-group labels and their order can be changed / reordered using \code{var.labels} and \code{var.labels.reorder}.
}
}

\examples{
example(importDittoBulk, echo = FALSE)
myRNA

dittoBarPlot(myRNA, "clustering", group.by = "groups")
dittoBarPlot(myRNA, "clustering", group.by = "groups",
    scale = "count")

# Reordering the x-axis groupings to have "C" (#3) come first
dittoBarPlot(myRNA, "clustering", group.by = "groups",
    x.reorder = c(3,1,2,4))

### Accessing underlying data:
# as dataframe
dittoBarPlot(myRNA, "clustering", group.by = "groups",
    data.out = TRUE)
# through hovering the cursor over the relevant parts of the plot
if (requireNamespace("plotly", quietly = TRUE)) {
    dittoBarPlot(myRNA, "clustering", group.by = "groups",
        do.hover = TRUE)
    }

}
\author{
Daniel Bunis
}
