#' Edit the Rprofile.site file
#'
#' Function to edit the Rprofile.site file
#'
#' @param create_file boolean indicating if the Rprofile.site file should be created if it doesn't exist.
#'@export
edit_rprofile.site <- function(create_file = FALSE){
    site_path = R.home(component = "home")
    file_path = file.path(site_path, "etc", "Rprofile.site")
    if (!file.exists(file_path)) {
        if (create_file) {
            file.create(file_path)
        }else{
            stop(paste(file_path,
                       "doesn't exist: use 'create_file = FALSE'",
                       "to create it"))
        }
    }
    file.edit(file_path)
}
