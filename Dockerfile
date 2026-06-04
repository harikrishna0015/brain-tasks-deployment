FROM public.ecr.aws/nginx/nginx:stable-alpine

COPY dist/ /usr/share/nginx/html/

EXPOSE 80
