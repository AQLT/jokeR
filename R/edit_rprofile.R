#'@export
edit_rprofile.site <- function(){
    file <- file.path(dirname(.libPaths()),"etc/Rprofile.site")
    if(!file.exists(file))
        stop(paste("File Rprofile.site not found in", file))
    file.edit(file)
}
