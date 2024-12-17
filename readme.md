1) Build the dockerfile with the command 
   docker build -t entrypoint .
2) Once it is built, run the built image
   docker run -it entrypoint bash
3) Clone this repository https://github.com/tektoncd/pipeline.git and change directory to cmd/entrypoint
   git clone https://github.com/tektoncd/pipeline.git
   cd cmd/entrypoint
4) Then build the entrypoint utility from here with go
   go build -o entrypoint
   And that's it, you can use the entrypoint utility of tekton with ./entrypoint.
5) To use the binary globally, move it to a directory in your system's PATH, such as /usr/local/bin:
   sudo mv entrypoint /usr/local/bin/
