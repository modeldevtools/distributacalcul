# set.seed(2019)
# nn<-10000
# 
# Xn<-rgamma(nn,2,1/5)
# Wn<-cumsum(Xn)/(1:nn)
# plot(1:nn,Wn,type="l",xlab="n",ylab="Wn")
# 
# Xn<-rgamma(nn,2,1/5)
# Wn<-cumsum(Xn)/(1:nn)
# points(1:nn,Wn,type="l")
# 
# Xn<-rgamma(nn,2,1/5)
# Wn<-cumsum(Xn)/(1:nn)
# points(1:nn,Wn,type="l")
# 
# Xn<-rgamma(nn,2,1/5)
# Wn<-cumsum(Xn)/(1:nn)
# points(1:nn,Wn,type="l")
# 
# Xn<-rgamma(nn,2,1/5)
# Wn<-cumsum(Xn)/(1:nn)
# points(1:nn,Wn,type="l")


# shapeLLN_tool <- 3
# rateLLN_tool <- 2
# n.simul_LLN_tool <- 10000
# Xn_LLN_tool <- rgamma(n = n.simul_LLN_tool, shape = shapeLLN_tool, rate = rateLLN_tool)
# Wn_LLN_tool <- cumsum(Xn_LLN_tool)/(1:n.simul_LLN_tool)
# Wn_LLN_tool <- cumsum(rgamma(n = n.simul_LLN_tool, shape = shapeLLN_tool, rate = rateLLN_tool))/(1:n.simul_LLN_tool)
# E_LLN_tool <- E_gamma(shapeLLN_tool, rateLLN_tool)
# c(pmin(mean(Xn_LLN_tool), E_LLN_tool), pmax(mean(Xn_LLN_tool), E_LLN_tool))
# l <- ggplot(data = data.frame("abscisse" = 1:n.simul_LLN_tool,
#                    "ordonnée" = Wn_LLN_tool),
#        aes(x = abscisse,
#            y = ordonnée)
#        ) +
#     geom_line()
# library('ggedit')
# ggedit(l)

tab_LLN_tool <- tabItem(tabName = "LLN_tool",
                        
                        fluidRow(
                            titlePanel("Loi des grands nombres"),
                            # withMathJax(),
                            align = "center"
                        ),
                        fluidRow(
                            column(
                                width = 4,
                                boxPlus(
                                    title = "Paramètres",
                                    status = "primary",
                                    solidHeader = T,
                                    width = NULL,
                                    closable = F,
                                    # Afin de rendre les input réactifs et d'être en mesure de changer, entre autre, leurs labels ils sont render en UI
                                    uiOutput("server_shapeLLN_tool"),
                                    uiOutput("server_rateLLN_tool"),
                                    uiOutput("E_LLN_tool_ui"),
                                    uiOutput("server_nb_simul_LLN_tool"),
                                    uiOutput("server_frame_speed_LLN_tool"),
                                    uiOutput("server_transition_speed_LLN_tool"),
                                    p("Distribution"),
                                    selectInput(inputId = "distr_select_LLN_tool",
                                                label = "",
                                                choices = c("Gamma",
                                                            "Lognormale",
                                                            "Pareto")
                                    ),
                                    align = "center"
                                )
                            ),
                            column(
                                width = 8,
                                boxPlus(
                                    # Le titre est en UI pour le changer selon la distribution choisie
                                    title = uiOutput("title_plot_LLN_tool"),
                                    status = "primary",
                                    solidHeader = T,
                                    width = NULL,
                                    closable = F,
                                    plotlyOutput("plot_LLN_tool")
                                )
                            )
                        )
)