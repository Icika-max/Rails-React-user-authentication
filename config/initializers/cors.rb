Rais.application.config.middleware.insert_before 0, Rack::core do
    allow do
        origin "http://localhost:3000"
        resource "*", headers: any, methods: [:get, :post, :put, :patch, delete, :options, :head], credentials:true
    end
    allow do
        origin "https://service-connect-smmw.vercel.app/"
        resource "*", headers: any, methods: [:get, :post, :put, :patch, delete, :options, :head], credentials:true
    end
end