FROM hashicorp/terraform:full
LABEL maintainer="Leroy Foerster <gersilex@gmail.com>"

# Install bzr version control system
RUN apk add bzr

# Install terraform provider by runtastic with additional developments by Immowelt Group
RUN go get -v github.com/ImmoweltGroup/terraform-provider-opennebula && \
    go install -v github.com/ImmoweltGroup/terraform-provider-opennebula

# Mount your terraform code into the WORKDIR
WORKDIR /terraform

# Don't enforce entrypoint to make compatible with CI/CD tools like Jenkins
ENTRYPOINT []
