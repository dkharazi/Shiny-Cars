library(shiny)

shinyUI(
  navbarPage("Motor Trend US Magazine",
             tabPanel("Home",
                      h2("Motor Trend Car Road Tests"),
                      hr(),
                      h3("Description"),
                      p("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models)."),
                      h3("Format"),
                      p("A data frame with 32 observations on 11 (numeric) variables."),
                      h3("Source"),
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411."),
                      h3("Examples"),
                      p("require(graphics)"),
                      p("pairs(mtcars, main = 'mtcars data', gap = 1/4)"),
                      p("coplot(mpg ~ disp | as.factor(cyl), data = mtcars,"),
                      p("panel = panel.smooth, rows = 1)"),
                      p("## possibly more meaningful, e.g., for summary() or bivariate plots:"),
                      p("mtcars2 <- within(mtcars, {"),
                      p("vs <- factor(vs, labels = c('V', 'S'))"),
                      p("am <- factor(am, labels = c('automatic', 'manual'))"),
                      p("cyl  <- ordered(cyl)"),
                      p("gear <- ordered(gear)"),
                      p("carb <- ordered(carb)"),
                      p("})"),
                      p("summary(mtcars2)")
             ),
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("Automobile Design and Performance"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable of Interest:",
                                        c("Number of Cylinders" = "cyl",
                                          "Type of Engine" = "vs",
                                          "Type of Transmission" = "am",
                                          "Number of Forward Gears" = "gear",
                                          "Number of Carburetors" = "carb"
                                        )),
                            checkboxInput("names", "Include Hinges", FALSE)
                          ),
                          
                          mainPanel(
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Box Plot", plotOutput("boxplot")),
                                        tabPanel("Bar Chart", 
                                                 plotOutput("barchart")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Details",
                      p("mpg - Miles/(US) gallon"),
                      p("cyl - Number of cylinders"),
                      p("disp	- Displacement (cu.in.)"),
                      p("hp	- Gross horsepower"),
                      p("drat	- Rear axle ratio"),
                      p("wt	- Weight (lb/1000)"),
                      p("qsec	- 1/4 mile time"),
                      p("vs	- V/S"),
                      p("am	- Transmission (0 = automatic, 1 = manual)"),
                      p("gear	- Number of forward gears"),
                      p("carb	- Number of carburetors")
             ),
             tabPanel("GitHub",
                      a("GitHub Repository", href = "https://github.com/dkharazi", target = "_blank")
             )
  )
)