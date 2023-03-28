import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/반갑습니다!/i);
  expect(linkElement).toBeInTheDocument();
});

test('renders learn react link 2', () => {
  render(<App />);
  const linkElement = screen.getByText(/메롱/i);
  expect(linkElement).toBeInTheDocument();
});