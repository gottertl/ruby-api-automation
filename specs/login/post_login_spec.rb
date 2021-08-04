require_relative "../routes/login"

describe "POST /login" do
    context "login com sucesso" do
        before() do
            @result = Login.new.login("eve.holt@reqres.in", "cityslicka")
        end

        it "should return status code 200" do
            expect(@result.code).to eql 200
        end

        it "should return a token" do
            expect(@result.parsed_response["token"].length).to eql 17
        end
    end

    context "senha nao informada" do
        before() do
            @result = Login.new.login("eve.holt@reqres.in", "")
        end

        it "should return status code 400" do
            expect(@result.code).to eql 400
        end

        it "should return an error message" do
            @error = "Missing password"
            expect(@result.parsed_response["error"]).to eql @error
        end
    end
end