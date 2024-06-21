# API

This is a very simple API. It consists of three endpoints:

- [`POST /v1/remove`](#v1)
- [`POST /v2/remove`](#v2)
- [`GET /openapi.yaml`](#spec)

<a id="v1"></a>

## POST /v1/remove

### Submit image for background removal

Requires an `application/json` request body, with a JSON object as payload. A base64 string representation of the image should be added as the value for an `"image" field.

Returns an `application/json` response body, with a JSON object as payload. A base64 string representation of the modified image will be found under the "result" field

#### Sample HTTP request

```
POST /v1/remove HTTP 1.1
Content-type: application/json

{
  "image": "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAAMUlEQVR4nGKRslBnwAYmG33GKs6EVRQPGNVADGB0sXuBVUJq0Rzq2DCqgRgACAAA///WdQUVuNf8NgAAAABJRU5ErkJggg=="
}
```

#### Sample HTTP response

```
200 OK
Content-type: application/json

{
  "result": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAABBElEQVR4nOWQvU4DQQyEx97NJhclIIHokCh5OF6UlhqJCtEmISS5Pa89FPlTECUdU7iyPfMN8A8lp3EW/9ahzDsdZU0KgCQ96OHWWAcS5E+/fH/z1E0eImpKXcQQUbe7t8329Wv8bJsBJJwARMAggPy5frG2EORSbt03wdbXd9JyV+pyJ0lBAuARVEUkvA9WspHR2rqvH9j/vGjiEC1bW1lbmS1FUkpT1WK2ABDWgEOMI6+AzBGV9IgtQSCAOUQAStJfW1KGlXKX0lwkCxLoIJNORS8PjglzHl3nNKsgY2j0jCuApHtvhzWR0zadeTZ99OhVx6od2TRNlGZt5d72qGd4EsA3s4GnN8Hywe0AAAAASUVORK5CYII="
}
```

<a id="v2"></a>

## POST /v2/remove

### Submit image for quick edition and background removal

Requires an `application/json` request body, with a JSON object as payload. Two fields are required:

- `"image"`: A base64 string representation of the image.
- `"expr"`: A valid [image expression](https://pillow.readthedocs.io/en/stable/reference/ImageMath.html#expression-syntax) string.

Returns an `application/json` response body, with a JSON object as payload. A base64 string representation of the modified image will be found under the "result" field

#### Sample HTTP request

```
POST /v2/remove HTTP 1.1
Content-type: application/json

{
  "expr": "convert(image, 'L')",
  "image": "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAAMUlEQVR4nGKRslBnwAYmG33GKs6EVRQPGNVADGB0sXuBVUJq0Rzq2DCqgRgACAAA///WdQUVuNf8NgAAAABJRU5ErkJggg=="
}
```

#### Sample HTTP response

```
200 OK
Content-type: application/json

{
  "result": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAAEElEQVR4nGNgGAWjYBTAAAADEAABPywr7AAAAABJRU5ErkJggg=="
}
```

<a id="spec"></a>

## GET /openapi.yaml

### Retrieve OAS 3.0 Spec

Returns the OpenAPI specification for this API as a `text/yaml` file.