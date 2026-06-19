library(metricminer)

#form_url <- "https://docs.google.com/forms/d/1pPj2aLG7cvf77rKW6d2sEmTrvdJFalXZSVVleWkBb5M/edit"
#form_id <- get_google_form(form_url)
#class(form_id)
#answerframe <- as.data.frame(form_id[3])
#answerframe <- answerframe[!duplicated(answerframe),]

timecode <- function(x){ #This is coding the different responses to the "How long do you use X social media" question as the minimum numbers, exluding less than 1
    if(x=="Dont Use"){
        return(0)
    }
    if(x=="Less than 1 hour"){
        return(0.5) #The reason for this is to eliminate the overlap with "Dont Use"
    }
    if(x=="Less than 3 hours"){
        return(1)
    }
    if(x=="Less than 5 hours"){
        return(3)
    }
    if(x=="Less than 7 hours"){
        return(5)
    }
    if(x=="Less than 9 hours"){
        return(7)
    }
    if(x=="Less than 10 hours"){
        return(9)
    }
    if(x=="Atleast 10 hours"){
        return(10)
    }
    if(x=="NA"){
        return(NULL)
    }
}
watchcode <- function(x){ #This is coding the different responses to the "How often do you watch" question as numbers
    if(x=="Haven't Seen"){
        return(0)
    }
    if(x=="Have been recomended but havent seen"){
        return(1)    
    }    
    if(x=="Have seen"){
        return(2)
    }
    if(x=="Watch Occasionally"){
        return(3)
    }
    if(x=="Watch frequently"){
        return(4)
    }
    if(x=="NA"){
        return(NULL)
    }    
}
choicegridconversion <- function(x){ #This is coding the different likert-like grid responses from the multipule choice grids into number format
    if(x=="Strongly Negative" || x=="Fully Disagree"){
        return(-2) #Ive gone with a negative to positive scale here to represenet that the beleifs are directed. They arent incremental 0 to n but on a continum -a to a
    }
    if(x=="Somewhat Negative" || x=="Slightly Disagree"){
        return(-1)
    }
    if(x=="Neutral/No Opinion" || x=="Neutral"){
        return(0)
    }
    if(x=="Somewhat Positive" || x=="Slightly Agree"){
        return(1)
    }
    if(x=="Strongly Positive" || x=="Fully Agree"){
        return(2)
    }
    if(x=="Mixed/Unsure" || x=="Mixed"){ #This value is annoying, it doesnt fit into a typical number schema. And it is meaningfully different from Neutral
        return(NULL)
    }
    if(x=="NA"){
        return(NULL)
    }
}
checkboxscore <- function(x){
    if(x=="Impairment in interpersonal relationships"){
        return(1)
    }
    if(x=="Tendency towards manipulative behaviour, conscious or not"){
        return(1)
    }
    if(x=="Impairment in emotional stability and self-regulation, suppressive or overt"){
        return(1)
    }
    if(x=="Impairment in understanding of social norms"){
        return(1)
    }
    if(x=="Aggressive tenendies"){
        return(1)
    }
    if(x=="Passive tendencies"){
        return(1)
    }
    if(x=="Unusual stubbornness of beliefs"){
        return(1)
    }
    if(x=="Unusual weakness of beliefs"){
        return(1)
    }
    if(x=="None of the above"){
        return(-8)
    }
    if(x=="NA"){
        return(NULL)
    }   
}
