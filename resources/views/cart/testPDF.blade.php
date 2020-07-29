<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
<table>
<thead>
  <tr>
    <th>name</th>
    <th>image</th>
    <th>price</th>
  </tr>
</thead>
  @foreach($data as $item)
    <tr>
      <td>{{$item}}</td>
    </tr>
  @endforeach
  </table>
</body>
</html>
