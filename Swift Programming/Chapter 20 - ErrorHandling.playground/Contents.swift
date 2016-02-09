// Swift Programming Chapter 20

/* Error Handling */

import Cocoa

enum Token
{
    case Number (Int)
    case Plus
}

class Lexer
{
    enum Error:ErrorType
    {
        case InvalidCharacter (Character)
    }

    let input:String.CharacterView
    var position:String.CharacterView.Index

    init (input:String)
    {
        self.input = input.characters
        self.position = self.input.startIndex
    }

    func peek () -> Character?
    {
        guard position < input.endIndex else {return nil}
        return input[position]
    }

    func advance ()
    {
        assert (position < input.endIndex, "Cannot advance past the end!")
        ++position
    }

    func getNumber() -> Int
    {
        var value = 0

        while let nextCharacter = peek()
        {
            switch nextCharacter
            {
            case "0" ... "9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
            default:
                // A non-digit - go back to regular lexing
                return value
            }
        }

        return value
    }

    func lex () throws -> [Token]
    {
        var tokens = [Token]()

        while let nextCharacter = peek()
        {
            switch nextCharacter
            {
                case "0"..."9":
                    // Start of a number - need to grab the rest
                    let value = getNumber()
                    tokens.append (.Number(value))
                case "+":
                    tokens.append (.Plus)
                    advance()
                case " ":
                    // Just advance to ignore spaces
                    advance()
                default:
                    // Something unexpected - need to send back an error
                    throw Error.InvalidCharacter (nextCharacter)
            }
        }

        return tokens
    }
}

class Parser
{
    enum Error:ErrorType
    {
        case UnexpectedEndOfInput
        case InvalidToken (Token)
    }

    let tokens:[Token]
    var position = 0

    init (tokens:[Token])
    {
        self.tokens = tokens
    }

    func getNextToken() -> Token?
    {
        guard position < tokens.count else {return nil}
        return tokens[position++]
    }

    func getNumber () throws -> Int
    {
        guard let token = getNextToken() else {throw Error.UnexpectedEndOfInput}

        switch token
        {
        case .Number (let value):
            return value
        case .Plus:
            throw Error.InvalidToken (token)
        }
    }

    func parse () throws -> Int
    {
        // Require a number first
        // Because this is a throwing method, you do not need a do/catch block
        // If it throws then this method will re-throw it to the caller
        var value = try getNumber()

        while let token = getNextToken()
        {
            switch token
            {
            // Getting a plus after a number is legal
            case .Plus:
                // Afer a plus we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
            // Getting a Number after a Number is not legal
            case .Number:
                throw Error.InvalidToken (token)
            }
        }

        return value
    }
}

func evaluate (input:String)
{
    print ("Evaluating: \(input)")
    let lexer = Lexer (input:input)

    // Inside the do scope you are allowed to call functions or methods that throw
    // Every call that could throw must be marked with the keyword try
    // If any of the functions or methods do throw then the catch block is run
    // You can also ignore throws using try!, but your app will trap on a throw
    // To ignore throws and not trap use the keyword try?
    do
    {
        let tokens = try lexer.lex()
        print ("Lexer output: \(tokens)")

        let parser = Parser (tokens:tokens)
        let result = try parser.parse()
        print ("Parser output: \(result)")
    }
    catch Lexer.Error.InvalidCharacter (let character)
    {
        print ("Input contained an invalid character: \(character)")
    }
    catch Parser.Error.UnexpectedEndOfInput
    {
        print ("Unexpected end of input during passing")
    }
    catch Parser.Error.InvalidToken (let token)
    {
        print ("Invalid token during parsing: \(token)")
    }
    catch
    {
        print ("An error has occurred: \(error)")
    }
}

evaluate ("10 + 3 + 5")
evaluate ("1 + 2 + abcdefg")
