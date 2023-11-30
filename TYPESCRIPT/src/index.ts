const small = "s"
const medium = "m"
const large = "l"
const extralarge = "xl"

enum Size { small, medium, large, extralarge }

type Direction = {
    number: number,
    street: string,
    country: string
}

type Person = {
    readonly id: number,
    name: string,
    size: Size,
    direction: Direction
}

const object: Person = {
    id: 1,
    name: "Ana",
    size: Size.small,
    direction: {
        number: 2,
        street: "Pasaje nieves",
        country: "Ecuador"
    }
}